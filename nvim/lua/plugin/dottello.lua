local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

M.run_dotnet_menu = function()
    pickers.new({}, {
        prompt_title = "Dotnet CLI",
        
        -- Використовуємо dotnet complete для отримання варіантів
        finder = finders.new_job(function(prompt)
            if not prompt or prompt == "" then
                return { "dotnet", "complete" }
            end
            return { "dotnet", "complete", prompt }
        end, function(entry)
            return {
                value = entry,
                display = entry,
                ordinal = entry,
            }
        end),

        sorter = conf.generic_sorter({}),

        -- Стандартний прев'юер через системний виклик
        previewer = previewers.new_buffer_previewer({
            title = "Dotnet Help",
            define_preview = function(self, entry)
                local current_input = action_state.get_current_line()
                if current_input == "" then return end
                
                -- Формуємо команду: dotnet [те що в промпті] --help
                local cmd = "dotnet " .. current_input:gsub("^dotnet%s+", "") .. " --help"
                
                -- Виконуємо команду і заповнюємо буфер
                vim.fn.jobstart(cmd, {
                    stdout_buffered = true,
                    on_stdout = function(_, data)
                        if data then
                            vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, data)
                        end
                    end,
                })
            end,
        }),

        attach_mappings = function(prompt_bufnr, map)
            -- Tab для підстановки вибраного значення
            map("i", "<Tab>", function()
                local selection = action_state.get_selected_entry()
                if selection then
                    local picker = action_state.get_current_picker(prompt_bufnr)
                    picker:set_prompt(selection.value)
                end
            end)

            -- Enter для виконання
            actions.select_default:replace(function()
                local final_cmd = action_state.get_current_line()
                actions.close(prompt_bufnr)
                if final_cmd ~= "" then
                    -- Додаємо dotnet якщо забули
                    if not final_cmd:match("^dotnet") then
                        final_cmd = "dotnet " .. final_cmd
                    end
                    vim.cmd("split | term " .. final_cmd)
                end
            end)
            return true
        end,
        
        -- Чітке налаштування лейауту без конфліктів
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.9,
            height = 0.8,
            preview_width = 0.6,
        },
    }):find()
end

-- Гаряча клавіша
vim.keymap.set('n', '<leader>dn', M.run_dotnet_menu, { desc = "Dotnet Menu" })

return M
