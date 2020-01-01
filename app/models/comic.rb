class Comic < ActiveRecord::Base   

  belongs_to :user 

  has_many :comments
  has_many :commenters, through: :comments
  #commenters -> User model :class_name=> "User"

  belongs_to :series 

  has_many :publishers, through: :release_dates

  validates :issue_number, presence: true, length: {maximum: 5}
  validates :quantity_owned, presence: true 
  validates :condition, presence: true 
  validates :user_id, presence: true

  def series_title=(title)
    self.series = Series.find_or_create_by(title: title)
  end

  def series_title
     self.series ? self.series.title : nil
  end

end 