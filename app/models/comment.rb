class Comment < ActiveRecord::Base 

  belongs_to :commenter, :class_name=> "User", :foreign_key => "user_id"
  belongs_to :commented_comic, :class_name=> "Comic", :foreign_key => "comic_id"

  validates :content, presence: true

  scope :sorted, -> { order('created_at DESC') }
  
end 