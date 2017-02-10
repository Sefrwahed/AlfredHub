Rails.application.routes.draw do
  root 'alfred_modules#index'

  resources :alfred_modules do
    resources :versions do
      member do
        get 'download'
      end
    end
  end
end
