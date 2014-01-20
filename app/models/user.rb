require 'valid_email'
class User < ActiveRecord::Base

    has_many :workouts, dependent: :destroy
    has_many :workout_records, dependent: :destroy

    serialize :achievements, Array

    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :email, presence: true, email: true, uniqueness: true
    has_secure_password

def User.new_remember_token
    SecureRandom.urlsafe_base64
end

def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
end

private

    def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
    end
end
