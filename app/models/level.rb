class Level < ActiveRecord::Base
  belongs_to :category
  
  has_many :stage
end
