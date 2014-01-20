class Goal < ActiveRecord::Base
    belongs_to :user
    belongs_to :workout

    validates_presence_of :workout_id
    validates_numericality_of :number, :only_integer => true, :allow_nil => false,
        :message => "Target value must be entered as a whole number"

    include GoalsHelper

end