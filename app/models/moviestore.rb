class Moviestore < ActiveRecord::Base
  validates_presence_of :title, :genre, :stock, :release_date
  has_and_belongs_to_many :users
end
