class LogFbSharing < ActiveRecord::Base
  belongs_to :user
  belongs_to :fb_sharing_info
end
