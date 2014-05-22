class User < ActiveRecord::Base
  has_secure_password

  has_one :user_info
  has_one :learning_progress

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

  has_one :ranking_week_a
  has_one :ranking_week_b
  has_one :ranking_week_c
  has_one :ranking_week_d
  has_one :ranking_current

  has_many :user_best_score
  has_many :my_word
  has_many :my_coupon
  
  has_many :qpocn_order

  has_many :survey_result
  has_one :user_stage_info
end
