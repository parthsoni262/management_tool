Rails.application.routes.draw do
  resources :roles
  resources :m_companies
  resources :m_users
  resources :t_user_masters
  resources :m_roles
  resources :m_genders
end