class Publisher < ActiveRecord::Base 

  has_many :publisher_series
  has_many :series, through: :publisher_series

  validates :name, presence: true, length: {minimum: 1, maximum: 20}

end 