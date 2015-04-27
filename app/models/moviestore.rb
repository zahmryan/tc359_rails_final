class Moviestore < ActiveRecord::Base
  validates_presence_of :title, :genre, :stock, :release_date
  has_many :rentalses
  has_many :users, :through => :rentalses


  def self.search(search)
    if search
      self.where("title like ?", "%#{search}%")
    else
      self.all
    end
  end
end
