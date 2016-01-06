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
  get 'courses/enroll/:id' => 'courses#enroll', as: :courses_enroll
  get 'courses/unenroll/:id' => 'courses#unenroll', as: :courses_unenroll
  get 'courses/interested/:id' => 'courses#interested', as: :interested

  resources :users
  resources :courses do
    resources :reviews
  end

  namespace :api do
    resources :courses, only: [:index, :show]
  end

end
