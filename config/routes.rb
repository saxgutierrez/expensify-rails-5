Rails.application.routes.draw do
  root "dashboard#index"

  resources :expenses, only: [:index,:new, :create, :edit, :destroy, :update, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses, only: [:index, :create, :update, :destroy]
    end
  end
  
end
