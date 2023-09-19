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

    { -- Github Copilot
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true
                }
            })
            vim.api.nvim_set_keymap("i", "<Leader>,c", ":Copilot panel", {})
        end
    },

    { -- Line indentaion guides
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.list = true

            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true
            }
        end
    }
}
