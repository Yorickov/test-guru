Rails.application.routes.draw do
  root 'welcome#home'

  get :home, to: 'welcome#home'
  get :signup, to: 'users#new'
  get :signin, to: 'sessions#new'

  resources :users, except: :new
  resource :session, only: %i[create destroy]

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
