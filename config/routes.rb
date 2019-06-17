Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create update destroy] do
        resources :orders, only: %i[index show]
      end
      resources :tokens, only: [:create]
      resources :products
    end
  end
end
