class Coupon < ActiveRecord::Base
  has_many :my_coupon
  belongs_to :advertisement
end
