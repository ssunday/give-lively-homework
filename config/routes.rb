Rails.application.routes.draw do
  resources :nonprofits, only: %i[index update]
end
