Rails.application.routes.draw do
  post :websites, to: 'websites#index'
  get :subjects, to: 'subjects#index'
end
