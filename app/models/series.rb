class Series < ActiveRecord::Base 

  has_many :comics

  has_many :publisher_series
  has_many :publishers, through: :publisher_series

  validates :title, presence: true, length: {minimum: 1, maximum: 50}, uniqueness: true 
  
  def comic_ids=(ids)
    ids.each do |id|
      comic = Comic.find(id)
        self.comics << comic
    end
  end

  scope :alpha, -> { order(:title) }

end 

