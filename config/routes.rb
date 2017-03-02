Rails.application.routes.draw do
  devise_for :users
  root 'alfred_modules#index'

  resources :alfred_modules do
    resources :versions, only: [:new, :create, :destroy] do
      member do
        get 'download'
      end
    end
  end
end
