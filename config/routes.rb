Rails.application.routes.draw do
  resources :volunteers
  resources :volunteers
  # Maybe later:
  # redirect / to volunteers#new
end
