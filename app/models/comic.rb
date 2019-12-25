class Comic < ActiveRecord::Base   

  belongs_to :user 

  has_many :comments
  has_many :commenters, through: :comments
  #commenters -> User model :class_name=> "User"

  validates :series_title, presence: true
  validates :issue_number, presence: true, length: {maximum: 5}
  validates :quantity_owned, presence: true 
  validates :condition, presence: true 
  validates :user_id, presence: true

end 