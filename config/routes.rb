SimpleTasking::Application.routes.draw do
  resources :columns do 
      resources :answers, :controller => 'Columns::Answers'
  end

  resources :checklists do 
    resources :tasks, :controller => 'Checklists::Tasks'
    get 'create_task'
    get 'create_column'    
  end
  

  resources :groups

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  root :to => 'checklists#index'
end
