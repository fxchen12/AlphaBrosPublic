class WorkoutRecord < ActiveRecord::Base
    belongs_to :user
    belongs_to :workout

    validates_presence_of :workout_id
    validates_presence_of :duration, :unless => :distance?,
        :message => "You must enter a time, distance, or both to record your completed workout."
    validates_numericality_of :duration, :only_integer => true, :allow_nil => true,
        :greater_than_or_equal_to => 0,
        :message => "Time must be entered as a whole number"
    validates_numericality_of :distance, :only_integer => true, :allow_nil => true,
        :greater_than_or_equal_to => 0,
        :message => "Distance must be entered as a whole number"

    include WorkoutsHelper
end