Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :locations

  resources :events do
    collection do
      post :update_user_attendance
    end
  end

# authenticated :user do
#   root 'entries#index', as: "authenticated_root"
# end

  root 'welcome#index'

end
