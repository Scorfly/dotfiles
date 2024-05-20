---------------------------------------------------------------------------------------
--  General settings
---------------------------------------------------------------------------------------

vim.cmd([[
    set nocompatible
    set showmatch
    set ignorecase
    set mouse=v
    set hlsearch
    set autoindent
    set wildmode=longest,list
    filetype plugin indent on
    set cc=140
    set tabstop=4
    set expandtab
    set shiftwidth=4
    set softtabstop=4
]])

vim.opt.encoding="utf-8"
vim.g.mapleader = ","
vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"

---------------------------------------------------------------------------------------
--  Plugins
---------------------------------------------------------------------------------------

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
      }
  }

  use {
      "hrsh7th/nvim-cmp",
      requires = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp",
          'quangnguyen30192/cmp-nvim-ultisnips',
          'hrsh7th/cmp-nvim-lua',
          'octaltree/cmp-look',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-calc',
          'f3fora/cmp-spell',
          'hrsh7th/cmp-emoji',
          'hrsh7th/cmp-vsnip',
          'hrsh7th/vim-vsnip',
      }
  }

  use 'fatih/vim-go'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons'}

  use 'f-person/git-blame.nvim'

  use 'Mofiqul/dracula.nvim'
  use 'drewtempelmeyer/palenight.vim'
  use 'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use "pappasam/papercolor-theme-slim"
  use "olimorris/onedarkpro.nvim"
end)

---------------------------------------------------------------------------------------
--  Display git blame details
---------------------------------------------------------------------------------------

vim.cmd([[
    let g:gitblame_message_template = '<sha> • <author> • <date> • <summary>'
    let g:git_blame_enabled=0
]])

---------------------------------------------------------------------------------------
--  Auto completion
---------------------------------------------------------------------------------------

vim.cmd([[
    set completeopt=menu,menuone,noselect
]])

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--     })
-- })

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require('lspconfig')['gopls'].setup{
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    single_file_support = true,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require'lspconfig'.pylsp.setup{}

---------------------------------------------------------------------------------------
--  Status Line
---------------------------------------------------------------------------------------

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true
    --refresh = {
    --  statusline = 1000,
    --  tabline = 1000,
    --  winbar = 1000,
    --}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--vim.opt.termguicolors = true

---------------------------------------------------------------------------------------
--  Shortcuts
---------------------------------------------------------------------------------------

vim.cmd([[
    nnoremap <leader>t :NeoTreeShowToggle<CR>
    nnoremap <leader>n :bnext<CR>
    nnoremap <leader>p :bprevious<CR>
    nnoremap <leader>gbt :GitBlameToggle<CR>

    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>gi <cmd>GoImplements<cr>
    nnoremap <leader>gcr <cmd>GoCallers<cr>
    nnoremap <leader>gts <cmd>GoCoverage<cr>
    nnoremap <leader>gtc <cmd>GoCoverageClear<cr>
    nnoremap <leader>lsp <cmd>LspRestart<cr>
    nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<cr>
    nnoremap <leader>ep <cmd>lua vim.diagnostic.goto_prev()<cr>
    nnoremap <leader>en <cmd>lua vim.diagnostic.goto_next()<cr>
]])

-- nvim-go
local on_attach = function(client, bufnr)
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

---------------------------------------------------------------------------------------
--  Colors
---------------------------------------------------------------------------------------

vim.cmd([[
    let g:go_highlight_structs = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_parameters = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_format_strings = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_variable_assignments = 1
    let g:go_auto_type_info = 1
    let g:go_fmt_autosave = 1
    let g:go_mod_fmt_autosave = 1
    let g:go_gopls_enabled = 1

    syntax on
    colorscheme tokyonight-moon
]])

vim.cmd([[
    highlight TabChar ctermbg=black guibg=#312b55
    match TabChar /^\t\+/

    highlight ExtraWhitespace ctermbg=red guibg=red
    2match ExtraWhitespace /\s\+$/

]])

--- display error messages

vim.diagnostic.config({
    virtual_text = true
})

vim.o.updatetime = 1000
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
