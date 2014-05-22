class FbSharingInfo < ActiveRecord::Base
  belongs_to :advertisement
  has_many :log_fb_sharing
end
