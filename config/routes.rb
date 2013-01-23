# -*- encoding : utf-8 -*-
V8::Application.routes.draw do

  resources :options

  root :to => 'home#index' 

  match 'guangpan' => 'pages#guangpan'
  match 'baodao' => 'pages#baodao'
  match 'zhinanzhen' => 'pages#zhinanzhen'
  match 'zhidao'  => "pages#zhidao"
  match 'xianchang'  => "pages#xianchang"
  match 'wangpan'  => "pages#wangpan"
  match 'xingxiang'  => "pages#xingxiang"
  

  #这不是注册页面, 而是说服用户去购买的页面.
  
  #answer 并不需要路由, 直接显示在ask下面即可
    
  # match "feeds/notes(.:format)" => "feeds#notes", :as => :notes_rss
  
  
  resources  :discussions, :comments, :subjects

  
  resources :topics do
    resources :comments
  end
  
  resources :classrooms do
    resources :discussions
  end

  resources :notes, :constraints => {:id => /\d+/} do
    resources :comments
  end

  resources :resources, :constraints => {:id => /\d+/} do
    resources :comments
  end

  resources :testings do
    resources :comments
  end

  resources :articles, :constraints => {:id => /\d+/} do
    resources :comments
  end
  
  resources :courses do 
    resources :notes
  end
  
  resources :subjects do
    resources :courses
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
  match 'test'  =>  "testings#test", :via => :post  
  
  match '/classes/:id' => 'groups#show', :as => :group, :via => :get
  match '/classes/:id/topics/page(/:page)' => 'groups#show'
  match '/topics/page(/:page)' => 'topics#index'
  
  
  match '/classes/:id'  => "groups#update", :as => :group, :via => :put
  match '/classes/:id'  => "groups#destroy", :as => :group, :via => :delete
  
  match '/classes'  => "groups#index", :as => :groups, :via => :get
  match '/classes'  => "groups#create", :as => :groups, :via => :post
  
  match '/classes/new'  => "groups#new", :as => :new_group, :via => :get
  match '/classes/:id/edit'  => "groups#edit", :as => :edit_group, :via => :get
    
  match '/classes/:group_id/topics/:id' => 'topics#show', :as => :class_topic
  

  
  
  match 'resources/:path' => "resources#index", :as => :category_resources
  match 'notes/:path' => "notes#index", :as => :category_notes
  match 'articles/:path' => "articles#index", :as => :category_articles
  
  
  match 'resources/category/:path' => "resources#index", :as => :category_resources_old
  match 'notes/category/:path' => "notes#index", :as => :category_notes_old
  match 'articles/category/:path' => "articles#index", :as => :category_articles_old
  
  
  
  match '/courses/page(/:page)' => 'courses#index'
  
  match '/notes/page(/:page)' => 'notes#index'
  match '/notes/:path/page(/:page)' => 'notes#index'
  match '/notes/category/:path/page(/:page)' => 'notes#index'
  
  
  match '/articles/page(/:page)' => 'articles#index'
  match '/articles/:path/page(/:page)' => 'articles#index'
  match '/articles/category/:path/page(/:page)' => 'articles#index'
  
  
  match '/resources/page(/:page)' => 'resources#index'
  match '/resources/:path/page(/:page)' => 'resources#index'
  match '/resources/category/:path/page(/:page)' => 'resources#index'
  
  
  match '/testings/page(/:page)' => 'testings#index'
  match '/apps' => 'testings#index'
  match '/apps/:id' => 'testings#show'
  match '/apps/page(/:page)' => 'testings#index'
  
  match '/classrooms/:id/page(/:page)' => 'classrooms#show'
  match '/discussions/page(/:page)' => 'discussions#index'
  
  
  match '/people/page(/:page)' => 'people#index'
  

  
  
  
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
