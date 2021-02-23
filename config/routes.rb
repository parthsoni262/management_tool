Rails.application.routes.draw do
  resources :roles
  # get 'm_genders/index'
  # get 'm_genders/new'
  # get 'm_roles/index'
  # get 'm_roles/new'
  # get 't_users/index'
  # get 't_users/new'
  # get 't_users/show'
  #get 'm_user/new'
  #get '/m_company/mcompany'
  #get '/m_company/create'
  resources :m_companies #, only: %[index,new, create, show]
  resources :m_users
  resources :t_users
  resources :m_roles
  resources :m_genders
end