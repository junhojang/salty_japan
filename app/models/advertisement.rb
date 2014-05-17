class Advertisement < ActiveRecord::Base
  belongs_to :client
  has_one :coupon 
  has_one :fb_sharing_info
  has_one :advertisement_cpd
  has_one :advertisement_cpdm
  has_one :advertisement_cpx
end
