Rails.application.routes.draw do
  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#_new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'addcourses' => 'courses#new'
  get "courses/sort" => "courses#sort", as: :sort
  resources :users
  resources :courses

 namespace :api do
    resources :courses, only: [:index, :show]
  end

end
