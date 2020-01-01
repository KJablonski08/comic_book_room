class Publisher < ActiveRecord::Base 

  has_many :publisher_series
  has_many :series, through: :publisher_series

  validates :name, presence: true, length: {minimum: 5, maximum: 25}

end 