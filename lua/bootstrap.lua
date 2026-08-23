-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim resets the runtimepath, which drops the directory holding Neovim's
-- bundled treesitter parsers when the distro ships them outside $VIMRUNTIME
-- (on Ubuntu they live in /usr/lib/nvim, which arrives via 'packpath').
-- Collect whatever currently provides a parser/ dir and hand it back to lazy.
local parser_paths = {}
for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
  if vim.fn.isdirectory(path .. "/parser") == 1 then
    table.insert(parser_paths, path)
  end
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  performance = {
    rtp = { paths = parser_paths },
  },
  -- No plugin here needs luarocks; disabling it skips the hererocks bootstrap.
  rocks = { enabled = false },
})
