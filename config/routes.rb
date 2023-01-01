Rails.application.routes.draw do
  get 'welcome', to: 'welcome#index'
  resources :messages do
    member do
      post :edit
    end
  end
  root "articles#index"
  resources :articles do
    resources :comments
  end
  resources :projects do 
    member do
      get 'vote', to: 'projects#vote_project', as: 'vote'
    end
  end
end
