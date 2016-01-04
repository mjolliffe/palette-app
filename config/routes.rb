Rails.application.routes.draw do
  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#_new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'courses' => 'courses#index'
  get 'addcourses' => 'courses#new'
  post 'courses' => 'courses#create'
  resources :users

end
