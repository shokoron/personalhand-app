Rails.application.routes.draw do
  get 'diagnoses/index'
  root to: "diagnoses#index"
end
