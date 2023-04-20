Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  concern :memberable do
    member do
      get :members
    end
  end

  resources :members
  resources :teams, concerns: %i[memberable]
  resources :projects, concerns: %i[memberable] do
    member do
      post :add_member
    end
  end
end
