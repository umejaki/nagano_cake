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
    get '/customers' => 'customers#show'
    get '/items' => 'customers#index'
     
  end

    

  namespace :admin do
    resources :items
    resources :customers
  end
end