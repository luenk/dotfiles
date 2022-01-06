Plug 'morhetz/gruvbox'

augroup GruvboxOverwrite
    autocmd!
    autocmd User PlugLoaded ++nested setlocal background=dark
    autocmd User PlugLoaded ++nested colorscheme gruvbox
augroup end
