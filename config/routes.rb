Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, path: :gurus

  get :home, to: 'welcome#home'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: :index
  end

  resource :feedback, only: %i[new create]
end
