Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :topics, only: [:index, :new, :create, :edit, :update ,:destroy, :show] do
    # collection do #collectionはidを含まないルーティング、memberはidを含んだルーティング定義
    #   post :confirm
    # end
    resources :comments
    post :confirm, on: :collection
  end
  root 'top#index'

  if Rails.env.development? #開発環境なら
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


end
