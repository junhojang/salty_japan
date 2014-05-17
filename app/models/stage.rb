class Stage < ActiveRecord::Base
  belongs_to :level

  has_many :user_best_score
  has_many :word
end
