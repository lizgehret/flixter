Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get 'privacy', to: 'static_pages#privacy'
  get 'team', to: 'static_pages#team'
  #hooking up courses for students
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]
  #hooking up courses for instructors - namespace b/c of separate views/permissions
  namespace :instructor do
    resources :lessons, only: [:update]
    resources :sections, only: [:update]
    resources :sections, only: [] do
      resources :lessons, only: [:create]
    end    
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:create]
    end
  end
end
