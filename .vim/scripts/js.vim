" set comment_leader for ruby comments
let b:comment_leader = '// '

let b:typescript_compiler_binary = 'npx tsc --noEmit'

" execute jest tests or whatever is set in package.json
nmap <silent> <leader>r :!time npm test -t %<CR>

" prettier on save
" autocmd BufWritePre *.js* setlocal formatprg=npm\ --silent\ run\ prettier
let g:prettier#autoformat = 0
let g:prettier#config#single_quote = "false"
let g:prettier#config#bracket_spacing = "true"
let g:prettier#config#jsx_bracket_same_line = "false"
let g:prettier#config#arrow_parens = "avoid"
let g:prettier#config#trailing_comma = "none"
let g:prettier#config#parser = "babylon"
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
