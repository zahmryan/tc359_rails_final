class Moviestore < ActiveRecord::Base
  validates_presence_of :title, :genre, :stock, :release_date
end
