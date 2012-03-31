SimpleTasking::Application.routes.draw do
  resources :columns do 
      resources :answers, :controller => 'Columns::Answers'
  end

  resources :checklists do 
      resources :tasks, :controller => 'Checklists::Tasks'
  end
  

  resources :groups

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    #get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  root :to => 'checklists#index'
end
