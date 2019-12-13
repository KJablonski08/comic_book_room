class User < ActiveRecord::Base 

  has_many :comics

  before_save {self.email = email.downcase}
  
  validates :username, presence: true, uniqueness: { case_sensative: false }, length: {minimum: 5, maximum: 25}
  VALID_EMAIL__REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, uniqueness: {case_sensative: false}, length: {maximum: 105}, format: { with: VALID_EMAIL__REGEX }

  has_secure_password

end 