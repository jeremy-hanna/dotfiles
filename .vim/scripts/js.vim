" set comment_leader for ruby comments
let b:comment_leader = '// '

let b:typescript_compiler_binary = 'npx tsc --noEmit'

" execute jest tests or whatever is set in package.json
nmap <silent> <leader>r :!time npm test -t %<CR>
