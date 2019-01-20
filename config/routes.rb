Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'urls/new', to: 'urls#new'
  get 'homepage', to: 'urls#new'
  root 'urls#new'
end
