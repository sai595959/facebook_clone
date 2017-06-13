Rails.application.routes.draw do



  devise_for :users
  resources :topics, only: [:index, :new, :create, :edit, :update ,:destroy, :show] do
    collection do #collectionはidを含まないルーティング、memberはidを含んだルーティング定義
      post :confirm
    end
  end
  root 'top#index'

  if Rails.env.development? #開発環境なら
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


end
