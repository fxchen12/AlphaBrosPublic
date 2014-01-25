require 'valid_email'
class User < ActiveRecord::Base
    has_merit
    has_many :workouts, dependent: :destroy
    has_many :workout_records, dependent: :destroy

    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :email, presence: true, email: true, uniqueness: true
    validates_presence_of :name
    has_secure_password

    after_create :seed_user

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

    def seed_user
        w = Workout.create(name: "Walking", user: self)
        Goal.create(workout: w, user: self, number: 60, 
            metric: "minutes", time_range: "day")
        Workout.create(name: "Running", user: self)
        self.update({:current_workout_id => w.id})
    end
end
