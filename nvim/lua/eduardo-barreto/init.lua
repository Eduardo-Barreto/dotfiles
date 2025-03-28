local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("eduardo-barreto.options")
require("eduardo-barreto.remap")
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function(args)
    vim.wo.wrap = true

    vim.keymap.set('n', '<leader>n', 'o-[ ]  <esc>i', { buffer = args.buf, noremap = true, desc = "Add new task" })

    vim.keymap.set('n', '<leader><cr>', function()
      local line = vim.api.nvim_get_current_line()
      if line:match('%-%[ %]') then
        local new_line = line:gsub('%-%[ %]', '-[x]')
        vim.api.nvim_set_current_line(new_line)
      elseif line:match('%-%[x%]') then
        local new_line = line:gsub('%-%[x%]', '-[ ]')
        vim.api.nvim_set_current_line(new_line)
      end
    end, { buffer = true, noremap = true, silent = true, desc = "Toggle task" })

    vim.api.nvim_create_autocmd('BufWinLeave', {
      buffer = args.buf,
      callback = function()
        if vim.bo.filetype == 'markdown' then
          vim.wo.wrap = false
        end
      end
    })
  end
})

function Colorize(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colorize()
