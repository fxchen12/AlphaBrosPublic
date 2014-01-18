class WorkoutRecord < ActiveRecord::Base
    belongs_to :user
    belongs_to :workout

    validates_presence_of :workout_id
    validates_presence_of :duration, :unless => :distance?,
        :message => "You must enter a time, distance, or both to record your completed workout."
    validates_numericality_of :duration, :only_integer => true,
        :message => "Time must be entered as a whole number"
    validates_numericality_of :distance, :only_integer => true,
        :message => "Distance must be entered as a whole number"

    # Returns hash workout record totals per workout, sorted by date range
    def totals
        workout_hash = Hash.new
        current_user.workouts.each do |w|
            # Today, This Week, This Month, This Year, Total
            inner_array = [
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless r.created_at.to_date != Date.today },
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless !((Date.beginning_of_week(start_day = :sunday)..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless !((Date.beginning_of_month..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless !((Date.beginning_of_year..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.duration }
            ]
            workout_hash[w] = inner_array
        end
        return workout_hash
end