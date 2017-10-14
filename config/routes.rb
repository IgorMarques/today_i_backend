Rails.application.routes.draw do
  resources :itens, only: %i(index create) do
    post '/toggle', to: 'itens#toggle'
  end
end
