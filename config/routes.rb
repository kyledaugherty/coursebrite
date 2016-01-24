Rails.application.routes.draw do
  devise_for :users

  resources :courses, only: [:new, :create, :show] do
    resource :course_dashboard, only: [:show], as: :dashboard, path: :dashboard
    resource :publication, only: [:create, :destroy]
  end

  root to: "landing#show"
end
