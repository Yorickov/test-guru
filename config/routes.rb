Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users, path: :gurus

  get :home, to: 'welcome#home'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
