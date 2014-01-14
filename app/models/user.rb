require 'valid_email'
class User < ActiveRecord::Base

    before_save { self.email = email.downcase }
    validates :email, presence: true, email: true, uniqueness: true
    has_secure_password
    validates :password, length: { minimum: 6 }

end
