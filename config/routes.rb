# -*- encoding : utf-8 -*-
V8::Application.routes.draw do

  resources :options

  root :to => 'home#index' 

  match 'guangpan' => 'pages#guangpan'
  match 'baodao' => 'pages#baodao'
  match 'xueyuan' => 'pages#xueyuan'
  match 'zhinanzhen' => 'pages#zhinanzhen'
  match 'faq' => 'pages#faq'
  match 'hezuo' => 'pages#hezuo'
  match 'qun'  => "pages#qun"

  #这不是注册页面, 而是说服用户去购买的页面.
  
  #answer 并不需要路由, 直接显示在ask下面即可
    
  # match "feeds/notes(.:format)" => "feeds#notes", :as => :notes_rss
  resources :people, :articles, :courses, :categories, :discussions, :topics, :notes, :resources, :comments, :subjects

  
  resources :classrooms do
    resources :discussions
  end

  resources :groups do
    resources :topics
  end
  
  resources :topics do
    resources :comments
  end

  resources :notes do
    resources :comments
  end

  resources :resources do
    resources :comments
  end

  resources :apps do
    resources :comments
  end

  resources :articles do
    resources :comments
  end
  
  resources :subjects do;
    resources :notes
  end

  resources :categories do
    resources :articles
    resources :resources
    resources :notes
  end
  
  
  resources :people do
    resources :subjects
  end
  
  match 'login' => 'sessions#new', :via => :get
  match 'login' => 'sessions#create', :via => :post
  match 'logout'  => 'sessions#destroy', :via => :delete
  match 'test'  =>  "apps#test", :via => :post
  match 'test2'  =>  "apps#test2", :via => :post
  match '/classes/:id'  => "groups#show", :as => :group
  match '/classes'  => "groups#index"
  match '/classes/:group_id/topics/:id' => 'topics#show', :as => :class_topic
  
  match 'resources/category/:path' => "resources#index", :as => :category_resources
  match 'notes/category/:path' => "notes#index", :as => :category_notes
  match 'articles/category/:path' => "articles#index", :as => :category_articles
  
  
  match '/courses/page(/:page)' => 'courses#index'
  
  match '/notes/page(/:page)' => 'notes#index'
  match '/notes/category/:path/page(/:page)' => 'notes#index'
  
  match '/articles/page(/:page)' => 'articles#index'
  match '/articles/category/:path/page(/:page)' => 'articles#index'
  
  match '/resources/page(/:page)' => 'resources#index'
  match '/resources/category/:path/page(/:page)' => 'resources#index'
  
  match '/classrooms/:id/page(/:page)' => 'classrooms#show'

  match '/classes/:id/page(/:page)' => 'groups#show'
  
  
  # match '/notes/categories(/:category_id)' , :controller=>"notes",:action=>"index"
  # match '/notes/category(/:category_id)' => 'notes#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :people
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #动态处理404错误
  match '*path' => proc { |env| Rails.env.development? ? (raise ActionController::RoutingError, %{No route matches "#{env["PATH_INFO"]}"}) : ApplicationController.action(:render_not_found).call(env) }  
  
end
