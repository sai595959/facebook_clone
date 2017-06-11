Rails.application.routes.draw do

  

  resources :topics, only: [:index, :new, :create, :edit, :update ,:destroy, :show] do
    collection do #collectionはidを含まないルーティング、memberはidを含んだルーティング定義
      post :confirm
    end
  end
  root 'top#index'

end
