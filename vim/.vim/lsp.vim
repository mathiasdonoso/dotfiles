let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = []

if executable('rust-analyzer')
    call add(lspServers, #{
                \   name: 'rust-analyzer',
                \   filetype: ['rust'],
                \   path: 'rust-analyzer',
                \   args: []
                \ })
endif

if executable('gopls')
    call add(lspServers, #{
                \   name: 'gopls',
                \   filetype: ['go'],
                \   path: 'gopls',
                \   args: []
                \ })
endif

if executable('clangd')
    call add(lspServers, #{
                \   name: 'clangd',
                \   filetype: ['c', 'cpp'],
                \   path: 'clangd',
                \   args: ['--background-index', '--clang-tidy']
                \ })
endif

if executable('typescript-language-server')
    call add(lspServers, #{
                \   name: 'tsserver',
                \   filetype: ['javascript', 'typescript'],
                \   path: 'typescript-language-server',
                \   args: ['--stdio']
                \ })
endif

let s:venv_bin = getcwd() .. '/.venv/bin/'

if executable(s:venv_bin .. 'basedpyright-langserver') || executable('basedpyright-langserver')
    " uv add --dev basedpyright
    call add(lspServers, #{
                \   name: 'basedpyright',
                \   filetype: ['python'],
                \   path: executable(s:venv_bin . 'basedpyright-langserver') ? s:venv_bin . 'basedpyright-langserver' : 'basedpyright-langserver',
                \   args: ['--stdio'],
                \   workspaceConfig: #{
                \     python: #{
                \       pythonPath: executable(s:venv_bin .. 'python') ? s:venv_bin .. 'python' : 'python3',
                \       analysis: #{
                \         autoSearchPaths: v:true,
                \         useLibraryCodeForTypes: v:true,
                \         diagnosticMode: 'workspace'
                \       }
                \     }
                \   }
                \ })
endif

if executable(s:venv_bin .. 'ruff') || executable('ruff')
    call add(lspServers, #{
                \   name: 'ruff',
                \   filetype: ['python'],
                \   path: executable(s:venv_bin .. 'ruff') ? s:venv_bin .. 'ruff' : 'ruff',
                \   args: ['server'],
                \ })
endif

autocmd User LspSetup call LspAddServer(lspServers)

nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
nnoremap <leader>ca :LspCodeAction<CR>
inoremap <silent> <C-Space> <C-x><C-o>

autocmd FileType php setlocal omnifunc=lsp#complete

autocmd User LspSetup call LspOptionsSet(#{
            \   popupBorder: v:true,
            \   popupBorderChars: ['═', '║', '═', '║', '╔', '╗', '╝', '╚'],
            \ })
