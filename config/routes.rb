Rails.application.routes.draw do
  # get 't_users/index'
  # get 't_users/new'
  # get 't_users/show'
  #get 'm_user/new'
  #get '/m_company/mcompany'
  #get '/m_company/create'
  resources :m_companies #, only: %[index,new, create, show]
  resources :m_users
  resources :t_users
end
