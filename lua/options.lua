local vim = vim
local  o = vim.opt
local g = vim.g

o.lazyredraw = true -- When this option is set, the screen will not be redrawn while executing macros, registers and other commands that have not been typed.
o.autoread = true -- When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
g.shortmess = 'filnxtToOFc' -- helps to avoid all the |hit-enter| prompts and to avoid some other messages. It is a list of flags.
o.clipboard = "unnamedplus" -- This allows neovim to access the system clipboard.
o.fileencoding = "utf-8" -- The encoding written to a file.

----- Visuals ----------------------------------------------------------------------------------------------------------

o.termguicolors = true -- Enables 24-bit RGB color in the TUI.
o.background = 'dark' --When set to "dark" or "light", adjusts the default color groups for that background type.
o.colorcolumn = '121' -- Useful to align text.
o.cursorline = true -- Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
o.number = true -- Print the line number in front of each line.
o.signcolumn = 'yes' -- always show signcolumn to prevent shifting signcolumn with gitgutter etc.
o.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
o.scrolloff = 7 -- Minimal number of screen lines to keep above and below the cursor.
o.sidescrolloff = 15 -- The minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set.
o.conceallevel = 0 -- Determine how text with the "conceal" syntax attribute |:syn-conceal| is shown: Concealed text is completely hidden unless it has a custom replacement character defined (see |:syn-cchar|).

------------------------------------------------------------------------------------------------------------------------

o.confirm = true -- Use a dialog when an operation has to be confirmed.
o.showmode = false -- If in Insert, Replace or Visual mode *do not* put a message on the last line.
o.splitbelow = true -- When on, splitting a window will put the new window below the current one.
o.splitright = true -- When on, splitting a window will put the new window right of the current one.

----- Wildmenu configuration for command-line completion ---------------------------------------------------------------

o.wildignorecase = true -- Ignore case when completing file names and directories.
o.wildchar = vim.api.nvim_replace_termcodes('<Tab>', true, true, true)[1] -- Character you have to type to start wildcard expansion in the command-line
o.wildmenu = true -- Enable wildmenu "enhanced mode", showing completions *above* the command line.
o.wildmode = 'list:longest,list:full' -- Completion behavior: When more than one match, list all matches and complete till longest common string.

------------------------------------------------------------------------------------------------------------------------

o.completeopt = 'menu,menuone,longest,noselect' -- Insert mode completion

----- Formatting -------------------------------------------------------------------------------------------------------

o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
o.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
o.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|, |>>|, |<<|, etc.
o.smarttab = true -- When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'. 'tabstop' or 'softtabstop' is used in other places.
o.listchars = 'tab:┣━,extends:@,trail:·' -- Strings to use in 'list' mode and for the |:list| command. It is a comma-separated list of string settings.
o.list = true -- Useful to see the difference between tabs and spaces and for trailing blanks. Further changed by the 'listchars' option.
o.textwidth = 120
o.wrap = false -- This option changes how text is displayed.  It doesn't change the text in the buffer, see 'textwidth' for that.
o.linebreak = true -- If on, Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the
o.formatoptions = 'tcrqnlj' -- This is a sequence of letters which describes how automatic formatting is to be done.  See |fo-table|.

------------------------------------------------------------------------------------------------------------------------

----- Undo configuration -----------------------------------------------------------------------------------------------

g.undodir = os.getenv('HOME') .. '/.cache/nvim/undo' -- List of directory names for undo files, separated with commas.
o.undofile = true -- When on, Vim automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
o.undolevels = 200 -- Maximum number of changes that can be undone.
o.undoreload = 10000 -- Save the whole buffer for undo when reloading it. The save only happens when this option is negative or when the number of lines is smaller than the value of this option.

------------------------------------------------------------------------------------------------------------------------

----- Search configuration ---------------------------------------------------------------------------------------------

o.wrapscan = false -- Searches wrap around the end of the file.  Also applies to |]s| and |[s|, searching for spelling mistakes.
o.hlsearch = true -- When there is a previous search pattern, highlight all its matches.
o.incsearch = true -- While typing a search command, show where the pattern, as it was typed so far, matches.  The matched string is highlighted.
o.ignorecase = true -- Ignore case in search patterns.
o.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters.

------------------------------------------------------------------------------------------------------------------------

g.printfont = 'Courier:h8' -- The name of the font that will be used for |:hardcopy|. See |pfn-option|.
vim.cmd [[set iskeyword+=-]]

