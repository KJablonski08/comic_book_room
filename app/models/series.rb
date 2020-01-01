class Series < ActiveRecord::Base 

  has_many :comics

  has_many :comic_publishers
  has_many :publishers, through: :comic_publishers

end 

