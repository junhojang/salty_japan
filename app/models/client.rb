class Client < ActiveRecord::Base
  has_secure_password

  has_many :advertisement
end
