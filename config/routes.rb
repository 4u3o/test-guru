# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users,
             controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions'
             },
             path: 'gurus',
             path_names: {
               sign_in: :login,
               sign_out: :logout
             }

  resources :badges, only: :index
  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
    resource :gist, only: :create
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
    resources :badges, except: :show
  end
end
