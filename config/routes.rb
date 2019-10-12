Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  #hooking up courses for students
  resources :courses, only: [:index, :show]
  #hooking up courses for instructors - namespace b/c of separate views/permissions
  namespace :instructor do
    resources :sections, only: [] do
      resources :lessons, only: [:new, :create]
    end    
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
end
