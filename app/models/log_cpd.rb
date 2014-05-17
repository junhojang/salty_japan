class LogCpd < ActiveRecord::Base
  belongs_to :user
  belongs_to :advertisement_cpd
end
