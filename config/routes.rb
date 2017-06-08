Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments
  end

  get({'welcome' => 'welcome#index'})
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
