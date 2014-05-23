autocmd User Rails noremap <buffer> <Plug><Plug>Console :Start rails console<CR>

let g:rails_gem_projections = {
      \ "active_model_serializers": {
      \   "app/serializers/*_serializer.rb": {
      \     "command": "serializer",
      \     "affinity": "model"}},
      \ "sidekiq": {
      \   "app/workers/*_worker.rb": {
      \     "command": "worker",
      \     "template":
      \       "class %SWorker\n  include Sidekiq::Worker\n\nend"}}}
