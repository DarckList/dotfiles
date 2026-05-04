return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
      --vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("vtsls")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")
      vim.lsp.enable("eslint")
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
        command = "lua vim.lsp.codelens.enable(true, { bufnr = bufnr })",
      })

      vim.keymap.set("n", "<leader>i", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
      end, { desc = "Toggle LSP Inlay Hints" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          if client:supports_method("textDocument/formatting", 0) then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
