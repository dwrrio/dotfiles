local lazypath=vim.fn.stdpath("data")
.."/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
"git",
"clone",
"https://github.com/folke/lazy.nvim.git",
"--filter=blob:none",
lazypath
})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

{
"nvim-treesitter/nvim-treesitter",
build=":TSUpdate"
},

{
"nvim-tree/nvim-tree.lua"
},

{
"nvim-lualine/lualine.nvim"
},

{
"neovim/nvim-lspconfig"
},

{
"hrsh7th/nvim-cmp"
},

{
"hrsh7th/cmp-nvim-lsp"
},

{
"nvim-telescope/telescope.nvim",
dependencies={"nvim-lua/plenary.nvim"}
}

})
