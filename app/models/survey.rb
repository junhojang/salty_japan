class Survey < ActiveRecord::Base
  belongs_to :advertisement_cpx
  has_many :survey_question
end
