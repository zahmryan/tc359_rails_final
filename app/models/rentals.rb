class Rentals < ActiveRecord::Base
  belongs_to :user
  belongs_to :moviestore
end
