" This comment tells :Dispatch to use the rspec compiler for zeus commands.
" This lets us `:Dispatch zeus rspec foo_spec.rb`. It applies to all :Dispatch
" commands using zeus, but we really only use it for rspec anyhow. A real
" solution will hopefully appear in this pull request someday:
"
" https://github.com/tpope/vim-dispatch/issues/10

" CompilerSet makeprg=zeus
