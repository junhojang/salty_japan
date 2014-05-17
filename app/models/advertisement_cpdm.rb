class AdvertisementCpdm < ActiveRecord::Base
  belongs_to :advertisement
  has_many :log_cpdm
end
