class AdvertisementCpx < ActiveRecord::Base
  belongs_to :advertisement
  has_many :log_cpx
  has_one :survey
end
