Rails.application.routes.draw do
  resources :nonprofits, only: %i[index update]
  namespace :check_transactions do
    post :send_check
  end
end
