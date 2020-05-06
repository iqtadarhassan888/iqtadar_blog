class User < ActiveRecord::Base
  validates :username, presence: true, 
  uniqueness: { case_sensitive: false }, #doesnot matter if it is in capslock or  small... it should not be same
  length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
             uniqueness: { case_sensitive: false }, 
             format: { with: VALID_EMAIL_REGEX }
end