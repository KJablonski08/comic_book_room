class User < ActiveRecord::Base 

  has_many :comics

  has_many :comments
  
  has_many :commented_comics, through: :comments
  #commented_comics -> comics model :class_name=> "Comic"

  before_save {self.email = email.downcase}
  
  validates :username, presence: true, uniqueness: { case_sensative: false }, length: {minimum: 5, maximum: 25}
  VALID_EMAIL__REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, uniqueness: {case_sensative: false}, length: {maximum: 105}, format: { with: VALID_EMAIL__REGEX }

  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_email = auth_hash['info']['email']
    if user = User.find_by(:email => oauth_email)
      return user 
    else 
      user = User.create(:email => oauth_email, :password => SecureRandom.hex) 
    end
  end 

end 