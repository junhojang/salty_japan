class Word < ActiveRecord::Base
  belongs_to :stage

  has_one :word_example
  has_many :my_word
end
