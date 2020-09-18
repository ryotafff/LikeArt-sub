Rails.application.routes.draw do

root 'homes#top'

devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'}

 devise_for :admins, controllers: {
        registrations: 'admins/registrations',
        passwords: 'admins/passwords',
        sessions: 'admins/sessions'
    }


get 'homes/top' => 'homes#top', as: 'users_top'
get 'homes/about' => 'homes#about', as: 'users_about'
get 'tags/:tag', to: 'artworks#index', as: :tag
resources :users, only: [:edit, :show, :update,] do
  resource :relationships, only: [:create, :destroy]
  get 'follows' => 'relationships#follower', as: 'follows'
  get 'followers' => 'relationships#followed', as: 'followers'
 end

resources :events do
  resource :likes, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
end

resources :artworks do
  resource :likes, only: [:make, :erase]
    post 'likes' => 'likes#make'
    delete 'likes' => 'likes#erase'
  resources :post_comments, only: [:save, :delete]
    post 'save' => 'post_comments#save'
    delete 'delete/:id'=> 'post_comments#delete' ,as: 'delete'
end



namespace :admins do
  get 'homes/top' => 'homes#top', as:'top'
  resources :users, only: [:index, :create, :edit, :show, :update ,:destroy]
  resources :events, only: [:index, :create, :edit, :show, :update ,:destroy]
  resources :artworks, only: [:index, :create, :edit, :show, :update ,:destroy]

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
