Rails.application.routes.draw do
  devise_for :users
  root to: "diagnoses#index"
  resources :users, only: [:show]

  resources :diagnoses, only: [:new, :create] do
    collection do
      get 'question1'
      get 'question2'
      get 'question3'
      get 'question4'
      get 'result'
    end
  end

  get 'recommended_rings/:ring_type', to: 'recommended_rings#show', as: :recommended_ring
end
