class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    #TODO: CHANGE TO VALIDATION GEM
    REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
    validates :email, presence: true, length: { maximum: 50 }, 
    format: { with: REGEX }, uniquness: true
    has_secure_password
    validates :password, length: { minimum: 6 }

end
