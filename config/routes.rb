Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, default: :json do
    namespace :v1 do
      resources :surveys, only: [:show] do
        post :submit, on: :member
      end
    end
  end
end
