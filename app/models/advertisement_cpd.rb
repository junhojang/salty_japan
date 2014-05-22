class AdvertisementCpd < ActiveRecord::Base
  belongs_to :advertisement
  has_many :log_cpd
end
