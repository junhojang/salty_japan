class User < ActiveRecord::Base
  has_many :user_info
  has_many :learning_progress

  has_many :log_user_login
  has_many :log_reward
  has_many :log_point
  has_many :log_test
  has_many :log_signup

  has_many :log_cpd
  has_many :log_cpdm
  has_many :log_cpx
  has_many :log_fb_sharing

  has_many :exchange

  has_many :ranking_week_a
  has_many :ranking_week_b
  has_many :ranking_week_c
  has_many :ranking_week_d
  has_many :ranking_current

  has_many :user_best_score
  has_many :my_word
  has_many :my_coupon
  
  has_many :qpocn_order

  has_many :survey_result
  has_mnay :user_stage_info
end
