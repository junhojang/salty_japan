class UserBestScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :stage
end
