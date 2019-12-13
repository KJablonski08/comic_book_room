class Comic < ActiveRecord::Base   

  belongs_to :user 

  validates :series_title, presence: true
  validates :issue_number, presence: true, length: {maximum: 5}
  validates :quantity_owned, presence: true 
  validates :condition, presence: true 
  validates :user_id, presence: true

end 