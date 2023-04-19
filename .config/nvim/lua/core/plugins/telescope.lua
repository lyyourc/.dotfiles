return {{
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'horizontal',
                -- https://www.reddit.com/r/neovim/comments/r22xrq/in_nvimtelescope_how_can_i_make_the_display_a/
                layout_config = {
                    prompt_position = 'top'
                },
                sorting_strategy = 'ascending'
            },

            -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories
            pickers = {
                find_files = {
                    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*"}
                }
            }
        })

    end
}}
