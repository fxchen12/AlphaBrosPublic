class Goal < ActiveRecord::Base
    belongs_to :user
    belongs_to :workout

    validates_presence_of :workout_id
    validates_numericality_of :number, :only_integer => true, :allow_nil => false,
        :greater_than => 0,
        :message => "Target number must be entered as a positive integer."

    include GoalsHelper

end