Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :offers, only: :index do
        resources :user_offers, shallow: true, path: :offers, only: %i[create destroy]
      end

      post "login",   to: "sessions#create"
      post "sign-up", to: "registrations#create"
    end
  end
end
