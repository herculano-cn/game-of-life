Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define the routes for the BoardsController
  resources :boards, only: [:create, :show] do
    member do
      get :next_state
      get 'future_state/:generations', to: 'boards#future_state', as: :future_state
      get :final_state
    end
  end

end
