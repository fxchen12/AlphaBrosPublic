module WorkoutsHelper

    # Returns hash workout record totals per workout, sorted by date range
    def record_totals
        workout_hash = Hash.new
        current_user.workouts.each do |w|
            # Today, This Week, This Month, This Year, Total [x2 for time & distance]
            inner_array = [
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless r.created_at.to_date != Date.today },
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless !((Date.beginning_of_week(start_day = :sunday)..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless !((Date.beginning_of_month..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.duration unless !((Date.beginning_of_year..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.duration },
            w.workout_records.inject(0){ |sum,r| sum += r.distance unless r.created_at.to_date != Date.today },
            w.workout_records.inject(0){ |sum,r| sum += r.distance unless !((Date.beginning_of_week(start_day = :sunday)..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.distance unless !((Date.beginning_of_month..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.distance unless !((Date.beginning_of_year..Date.today) === r.created_at.to_date) },
            w.workout_records.inject(0){ |sum,r| sum += r.distance }
            ]
            workout_hash[w] = inner_array
        end
        return workout_hash
    end
end
