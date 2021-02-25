Rails.application.routes.draw do
  resources :roles
  resources :m_companies
  resources :m_users
  resources :t_users
  resources :m_roles
  resources :m_genders
end