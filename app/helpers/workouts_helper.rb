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

end