class QpconOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :qpcon_products
end
