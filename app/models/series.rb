class Series < ActiveRecord::Base 

  has_many :comics

  has_many :comic_publishers
  has_many :publishers, through: :comic_publishers

  validates :title, presence: true, length: {minimum: 1, maximum: 25}

end 

