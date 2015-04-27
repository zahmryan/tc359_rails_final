class User < ActiveRecord::Base
  has_secure_password
  has_many :rentalses
  has_many :moviestores, :through => :rentalses
end
