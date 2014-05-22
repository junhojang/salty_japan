class QpconProducts < ActiveRecord::Base
  belongs_to :qpcon_category
  has_many :qpcon_order
end
