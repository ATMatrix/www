Rails.application.routes.draw do

  root to: 'home#index'

  get 'cn' => 'home#locale_redirect', locale: 'zh-CN'
  get 'en' => 'home#locale_redirect', locale: 'en'
  get 'instruction' => 'home#instruction'
  get 'refund' => 'home#refund'

  devise_for :users
  resources :users

  resources :posts, only: [:index, :show]

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
