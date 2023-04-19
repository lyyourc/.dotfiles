-- file explorer 
return  {{
    'kyazdani42/nvim-tree.lua',
    dependencies = {'kyazdani42/nvim-web-devicons' -- optional, for file icons
    },
    config = function()
        -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        require("nvim-tree").setup({
            git = {
                ignore = false
            }
        })
    end
}}