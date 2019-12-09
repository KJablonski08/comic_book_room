class Comic < ActiveRecord::Base   

  validates :series_title, presence: true
  validates :issue_number, presence: true 
  validates :quantity_owned, presence: true 
  validates :condition, presence: true 

end 