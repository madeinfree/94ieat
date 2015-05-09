Rails.application.routes.draw do
  devise_for :users
  "Hi!! Im developer1"
  "Hi!! Im deer1"

  "Hi!! Im developer23"
  #靜態頁面
  root 'stores#index'
  get 'about', to: 'pages#about', as: :about
  get 'wellcome', to: 'homes#index', as: :wellcome
 	
 	resources :locals 
  resources :stores
  resources :orders
	resources :products do
		member do 
			post :add_to_cart_item
      post :destroy_carts_product_path
		end
	end 
	resources :carts do
    collection do
      #cart可能會有的事件: 刪除一個、刪除多個、修改數量、優惠券(若是有行銷模組)
      #post :delete_one
      post ':product_id/delete_one', to: 'carts#delete_one', as: :delete_one
      post :delete_all
      post :modify_quantity

      #輸入訂購人資訊
      post :order_info
      #確認訂購人資訊及商品, 存到db去
      post :checkout
    end
  end
  
	#站方管理員
	namespace :spadm do
		root 'stores#index'
		resources :stores do
      collection do
        post ':store_id/change_status', to: 'stores#change_status', as: :change_status
        post ':store_id/del_store_product/:product_id', to: 'stores#del_store_product', as: :del_store_product
      end
    end
		resources :settings
		resources :store_categories
		resources :products
		resources :locals
    resources :orders
	end
	#營運管理員
	namespace :opadm do
		root 'stores#index'
		resources :stores
	end
 end
