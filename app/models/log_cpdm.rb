class LogCpdm < ActiveRecord::Base
  belongs_to :user
  belongs_to :advertisement_cpdm
end
