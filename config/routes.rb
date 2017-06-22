Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks" }
  resources :articles do
    resources :comments
    member do # /articles/1/image
      get :image
      get :download
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  get({'welcome' => 'welcome#index'})
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
