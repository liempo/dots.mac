return {
    { -- Tokyo Night
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end
    },


    { -- Dashboard
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true
                    }
               }
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    { -- File Explorer
        'nvim-tree/nvim-tree.lua',
        config = function()
          require('nvim-tree').setup {
              view = {
                width = 30,
              },
              renderer = {
                  group_empty = true
              }
          }
          vim.api.nvim_set_keymap('n', '<Leader>s', ':NvimTreeToggle<CR>', {
              noremap = true, silent = true
          })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    { -- Code highlighting
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
              ensure_installed = {
                "c", "lua", "vim", "html", "swift"
              }
            })
        end
    },

    { -- Status line
        'nvim-lualine/lualine.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled  = true,
                    theme = 'tokyonight'
                }
            }
        end
    },

    { -- Line indentaion guides
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                char = "",
                show_current_context = true,
                show_trailing_blankline_indent = false
            }
        end
    },

    { -- Fuzzy search
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    }

}
