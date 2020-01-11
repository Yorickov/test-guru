Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, path: :gurus

  get :home, to: 'welcome#home'

  resources :tests, only: :index do
    post :start, on: :member
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
      get :ready, on: :collection
      member do
        patch :update_inline
        patch :complete
        patch :revert
      end

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: :index

    resources :badges do
      get :level, on: :new
      get :category, on: :new
      get :all, on: :new
      get :first, on: :new
    end
  end

  resource :feedback, only: %i[new create]

  resources :badges, only: :index
end
