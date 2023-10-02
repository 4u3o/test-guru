Rails.application.routes.draw do
  get 'sessions/new'
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  get :signup, to: 'users#new'
  resources :users, only: :create

  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'
  resources :sessions, only: :create
end
