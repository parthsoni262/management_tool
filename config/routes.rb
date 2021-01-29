Rails.application.routes.draw do
  #get '/m_company/mcompany'
  #get '/m_company/create'
  resources :m_companies#, only: %[index,new, create, show]
end
