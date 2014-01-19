class Workout < ActiveRecord::Base
    belongs_to :user
    has_many :workout_records, dependent: :destroy

    include WorkoutsHelper

    # Returns sum of specified field values across 
    # all workout records within the indicated time range
    # that are associated with the current workout instance.
    def sum_field_by_time_range(field, time_f)
        self.workout_records.select{ |r| time_f.call(r) }.map{ |r| r.send(field).to_i }.sum
    end
end