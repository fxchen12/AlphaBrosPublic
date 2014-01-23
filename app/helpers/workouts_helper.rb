module WorkoutsHelper

    # Allows usage of date.beginning_of_x
    require 'active_support/core_ext/date/calculations.rb'

    # Allows usage of Array.sum
    require 'active_support/core_ext/enumerable.rb'

    # Returns hash of workout record totals sorted by workout and date range
    # Used in '/progress'
    def record_totals
        workout_hash = Hash.new
        current_user.workouts.each do |w|
            # Today, This Week, This Month, This Year, Total [x2 for time & distance]
            inner_array = [
                w.sum_field_by_time_range(:duration, method(:this_day)),
                w.sum_field_by_time_range(:duration, method(:this_week)),
                w.sum_field_by_time_range(:duration, method(:this_month)),
                w.sum_field_by_time_range(:duration, method(:this_year)),
                w.sum_field_by_time_range(:duration, method(:total)),
                w.sum_field_by_time_range(:distance, method(:this_day)),
                w.sum_field_by_time_range(:distance, method(:this_week)),
                w.sum_field_by_time_range(:distance, method(:this_month)),
                w.sum_field_by_time_range(:distance, method(:this_year)),
                w.sum_field_by_time_range(:distance, method(:total))
            ]
            workout_hash[w] = inner_array
        end
        return workout_hash
    end

    # Time range functions used by workout.sum_field_by_time_range
    def this_day(record)
        record.created_at.to_date == Time.current.to_date
    end

    def this_week(record)
        (Time.current.to_date.beginning_of_week(:sunday)..Time.current.to_date) === record.created_at.to_date
    end

    def this_month(record)
        (Time.current.to_date.beginning_of_month..Time.current.to_date) === record.created_at.to_date
    end

    def this_year(record)
        (Time.current.to_date.beginning_of_year..Time.current.to_date) === record.created_at.to_date
    end

    def total(record)
        true
    end

    # Returns an array where the 0th element is the total duration for (number) days ago, and the last is the total duration for the present day
    def history_by_time_period(workout,number,metric,time_period)
        multiplier = 1
        if time_period == "week"
            multiplier = 7
        elsif time_period == "month"
            multiplier = 30
        elsif time_period == "year"
            multiplier = 365
        end

        starting_time = Time.current.ago(number * 24 * 3600 * multiplier)
        day_array = []
        number.times do
            next_time = starting_time.since(24*3600 * multiplier)
            day_sum = workout.sum_field_by_custom_time_range(metric, method(:check_range), starting_time, next_time)
            day_array << day_sum
            starting_time = starting_time.since(24*3600 * multiplier)
        end
        return day_array
    end

    def check_range(start_time,end_time,record)
        ((start_time.to_date..end_time.to_date) === record.created_at.to_date)
    end

end