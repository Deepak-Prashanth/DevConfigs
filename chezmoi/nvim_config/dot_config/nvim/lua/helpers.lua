-- Vim script helpers ported from old rc file.
-- TODO: MakeSession and LoadSession is broken.
vim.api.nvim_exec([[
fun! ERLN()
  :set number relativenumber
  :set nu rnu
  :set signcolumn=yes
endfun

fun! DRLN()
  :set number norelativenumber
  :set nornu
  :set signcolumn=yes
endfun

function! CustomCloseHiddenBuffers()
  let i = 0
  let n = bufnr('$')
  while i < n
    let i = i + 1
    if bufloaded(i) && bufwinnr(1) < 0
      exe 'bd!' . i
    endif
  endwhile
endfunction

function! MakeSession()
  set sessionoptions=buffers, tabpages
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p' b:sessiondir
    redraw!
  endif
  let b:filename = b.sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' bisessionfile
  else
    echo "No session loaded."
  endif
endfunction

command! -nargs=0 MakeSession call MakeSession()
command! -nargs=0 LoadSession call LoadSession()
command! -nargs=0 CustomCloseHiddenBuffers call CustomCloseHiddenBuffers()
command! DeleteMarks silent! delm! | delm A-Z0-9

command! -nargs=0 EnableRelativeLineNumbers call ERLN()
command! -nargs=0 DisableRelativeLineNumbers call DRLN()
nnoremap ]r :EnableRelativeLineNumbers<CR>
nnoremap [r :DisableRelativeLineNumbers<CR>
]], false)

-- TODO: Disable Coc for unsupported buffers
-- vim.api.nvim_exec([[
-- let s:my_coc_file_types = ['c', 'cpp', 'h', 'asm', 'hpp']

-- function! s:disable_coc_for_type()
-- 	if index(g:my_coc_file_types, &filetype) == -1
-- 	        let b:coc_enabled = 0
-- 	endif
-- endfunction

-- augroup CocGroup
-- 	autocmd!
-- 	autocmd BufNew,BufEnter * call s:disable_coc_for_type()
-- augroup end
-- ]], false)

-- vim.api.nvim_exec([[
-- let g:coc_filetypes_enable = [ 'c', 'cpp', 'cxx', 'h', 'hpp', 'asm']
-- function! s:disable_coc_for_type()
--   if index(g:coc_filetypes_enable, &filetype) == -1
--     :silent! CocDisable
--   else
--     :silent! CocEnable
--   endif
-- endfunction

-- augroup CocGroup
--  autocmd!
--  autocmd BufNew,BufEnter,BufAdd,BufCreate * call s:disable_coc_for_type()
-- augroup end
-- ]], false)
