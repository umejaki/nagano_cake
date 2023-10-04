Rails.application.routes.draw do
  root to: "homes#top"
  get "/about" => "homes#about", as: "about"
 # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  
  
  scope module: :public do
    patch '/customer/edit' => 'customers#update'
    get '/customer' => 'customers#show'
    get '/customer/edit' => 'customers#edit'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    get '/orders/new' => 'orders#new'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :orders
    resources :items
    resources :cart_items
  end

    

  namespace :admin do
    get '/' => 'homes#top'
    resources :orders
    resources :items
    resources :customers
  end
end