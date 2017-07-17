Rails.application.routes.draw do

  root to: 'landing#index'
  get :about, to: 'static_pages#about'
  resources :topics, except: [:show] do
      resources :posts, except: [:show] do
          resources :comments, except: [:show] do

       end
     end
  end
  resources :users, only: [:new, :edit, :create, :update] do
     resources :session, only: [:new, :create, :destroy]
   end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
