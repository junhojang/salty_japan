Rails.application.routes.draw do
  
  namespace :api do
  # advertisement start
  get 'advertisement/get_cpd'
  get 'advertisement/get_cpdm'
  get 'advertisement/get_cpx'

  get 'advertisement/get_cpd_list'
  get 'advertisement/get_cpdm_list'
  get 'advertisement/get_cpx_list'

  get 'advertisement/get_coupon_list'
  get 'advertisement/get_my_coupon_list'

  get 'advertisement/set_cpd_log'
  get 'advertisement/set_cpdm_log'
  get 'advertisement/set_cpx_log'

  get 'advertisement/get_survey'
  get 'advertisement/get_survey_result'  
  # advertisement stop

  # etc start
  get 'etc/get_help_list'

  get 'etc/get_notice_list'
  get 'etc/get_main_notice_list'
  get 'etc/get_board_notice_list'
 
  get 'etc/get_app_info'
  get 'etc/get_prize_list'
  get 'etc/attendance'
  get 'etc/get_bank_list'
  get 'etc/get_ment'
  # etc end

  # rank start
  get 'rank/get_my_rank'
  get 'rank/get_rank_list'
  # rank end

  # store start
  get 'store/get_qpcon_list'
  get 'store/order_qpcon_product'
  get 'store/request_to_exchange_reward'
  # store end

  # study start
  get 'study/get_stage_info'
  get 'study/get_word_list'
  get 'study/set_my_word'
  get 'study/get_my_word_list'
  # study end

  # test start
  get 'test/chk_level_test_available'
  get 'test/get_level_test_words'
  get 'test/set_log_test'
  # test end

  # user start
  get 'user/chk_join_available'
  get 'user/chk_nickname_available'
  get 'user/signup_with_email'
  get 'user/det_facebook_login_method'
  get 'user/cross_signup'
  get 'user/signup_with_facebook'

  get 'user/withdraw_from_member'
  get 'user/login'

  get 'user/get_user_info'
  get 'user/get_learning_progress'
  get 'user/set_user_password'

  get 'user/change_user_password'
  get 'user/change_user_character'
  # user end
 
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
