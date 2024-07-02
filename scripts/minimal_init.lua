vim.g.lazy_loaded_plenary_nvim = true

vim.opt.rtp:append(vim.fn.stdpath("data") .. "lazy\\plenary.nvim")

vim.cmd("runtime plugin/plenary.vim")
