Rails.application.routes.draw do
  get "static_pages" => "static_pages#before_login"
  get "after_login"=>"static_pages#after_login"

  # Googleログイン用コールバック
  post "google_login_api/callback" => "google_login_api#callback"


  get "companies" => "companies#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
