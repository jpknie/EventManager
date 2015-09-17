Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :events
# authenticated :user do
#   root 'entries#index', as: "authenticated_root"
# end

  root 'welcome#index'

end
