# Defaults
## More default mappings
In addition to the new configuration APIs detailed above, we’ve also tried to make LSP simpler for new users by adding some more default key mappings. These mappings will not override users existing mappings, so experienced users are free to ignore them and use whatever mappings they are used to. The goal is to eliminate some steps for brand new users.

grn in Normal mode maps to vim.lsp.buf.rename()
grr in Normal mode maps to vim.lsp.buf.references()
gri in Normal mode maps to vim.lsp.buf.implementation()
gO in Normal mode maps to vim.lsp.buf.document_symbol() (this is analogous to the gO mappings in help buffers and :Man page buffers to show a “table of contents”)
gra in Normal and Visual mode maps to vim.lsp.buf.code_action()
CTRL-S in Insert and Select mode maps to vim.lsp.buf.signature_help()
[d and ]d move between diagnostics in the current buffer ([D jumps to the first diagnostic, ]D jumps to the last)
We’ve also included versions of some of the mappings from Tim Pope’s vim-unimpaired:

[q, ]q, [Q, ]Q, [CTRL-Q, ]CTRL-Q navigate through the quickfix list
[l, ]l, [L, ]L, [CTRL-L, ]CTRL-L navigate through the location list
[t, ]t, [T, ]T, [CTRL-T, ]CTRL-T navigate through the tag matchlist
[a, ]a, [A, ]A navigate through the argument list
[b, ]b, [B, ]B navigate through the buffer list
[<Space>, ]<Space> add an empty line above and below the cursor
=G          auto formatting file

h set complete ???




7. Insert mode completion               *ins-completion*

In Insert and Replace mode, there are several commands to complete part of a
keyword or line that has been typed.  This is useful if you are using
complicated keywords (e.g., function names with capitals and underscores).

Completion can be done for:

1. Whole lines                      |i_CTRL-X_CTRL-L|
2. keywords in the current file             |i_CTRL-X_CTRL-N|
3. keywords in 'dictionary'             |i_CTRL-X_CTRL-K|
4. keywords in 'thesaurus', thesaurus-style     |i_CTRL-X_CTRL-T|
5. keywords in the current and included files       |i_CTRL-X_CTRL-I|
6. tags                         |i_CTRL-X_CTRL-]|
7. file names                       |i_CTRL-X_CTRL-F|
8. definitions or macros                |i_CTRL-X_CTRL-D|
9. Vim command-line                 |i_CTRL-X_CTRL-V|
10. User defined completion             |i_CTRL-X_CTRL-U|
11. omni completion                 |i_CTRL-X_CTRL-O|
12. Spelling suggestions                |i_CTRL-X_s|
13. keywords in 'complete'              |i_CTRL-N| |i_CTRL-P|

Additionally, |i_CTRL-X_CTRL-Z| stops completion without changing the text.

All these, except CTRL-N and CTRL-P, are done in CTRL-X mode.  This is a
sub-mode of Insert and Replace modes.  You enter CTRL-X mode by typing CTRL-X
and one of the CTRL-X commands.  You exit CTRL-X mode by typing a key that is
not a valid CTRL-X mode command.  Valid keys are the CTRL-X command itself,
CTRL-N (next), and CTRL-P (previous).

To get the current completion information, |complete_info()| can be used.
Also see the 'infercase' option if you want to adjust the case of the match.

When inserting a selected candidate word from the |popup-menu|, the part of
the candidate word that does not match the query is highlighted using
|hl-ComplMatchIns|.  If fuzzy is enabled in 'completeopt', highlighting will
not be applied.

    1. Стрибок на початок рядка (найчастіший)
Якщо ви використовуєте одинарну лапку ('):

    'a — перемістить курсор на перший непустий символ того рядка, де була встановлена мітка a.

Це зручно, якщо вам просто треба повернутися в потрібну зону коду.

    2. Стрибок на точну позицію (прецизійний)
Якщо ви використовуєте зворотну лапку (backtick `):

    `a — перемістить курсор точно на той рядок і той стовпчик, де він знаходився в момент натискання ma.

Це ідеально, якщо ви редагували довгий рядок і хочете повернутися до конкретного символу.

