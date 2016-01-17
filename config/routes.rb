Rails.application.routes.draw do
  devise_for :users

  resources :courses, only: [:new, :create, :show]

  root to: "landing#show"
end
