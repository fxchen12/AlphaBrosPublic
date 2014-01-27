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

    def record_overall_total
        result_array = nil
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
            if result_array == nil
                result_array = inner_array
            else
                i = 0
                10.times do
                    result_array[i] += inner_array[i]
                    i += 1
                end
            end
        end
        return workout_hash
    end

    # Time range functions used by workout.sum_field_by_time_range
    def this_day(record)
        record.date == Date.today
    end

    def this_week(record)
        (Date.today.beginning_of_week(:sunday)..Date.today) === record.date
    end

    def this_month(record)
        (Date.today.beginning_of_month..Date.today) === record.date
    end

    def this_year(record)
        (Date.today.beginning_of_year..Date.today) === record.date
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

        starting_date = Date.today.prev_day(number * multiplier).next_day
        result_array = []
        number.times do
            next_date = starting_date.next_day(multiplier).prev_day
            result_sum = workout.sum_field_by_custom_time_range(metric, method(:check_range), starting_date, next_date)
            result_array << result_sum
            starting_date = starting_date.next_day(multiplier)
        end
        return result_array
    end

    def history_by_time_period_all(number,metric,time_period)
        result_array = nil
        current_user.workouts.each do |w|
            if result_array == nil
                result_array = history_by_time_period(w,number,metric,time_period)
            else
                i = 0
                activity_array = history_by_time_period(w,number,metric,time_period)
                number.times do
                    result_array[i] += activity_array[i]
                    i += 1
                end
            end
        end
        return result_array
    end

    def cumulative_history_by_time_period(workout,number,metric,time_period)
        multiplier = 1
        if time_period == "week"
            multiplier = 7
        elsif time_period == "month"
            multiplier = 30
        elsif time_period == "year"
            multiplier = 365
        end

        starting_date = Date.today.prev_day(number * multiplier).next_day
        result_array = []
        result_sum = 0
        number.times do
            next_date = starting_date.next_day(multiplier).prev_day
            result_sum += workout.sum_field_by_custom_time_range(metric, method(:check_range), starting_date, next_date)
            result_array << result_sum
            starting_date = starting_date.next_day(multiplier)
        end
        return result_array
    end

    def cumulative_history_by_time_period_all(number,metric,time_period)
        result_array = nil
        current_user.workouts.each do |w|
            if result_array == nil
                result_array = cumulative_history_by_time_period(w,number,metric,time_period)
            else
                i = 0
                activity_array = cumulative_history_by_time_period(w,number,metric,time_period)
                number.times do
                    result_array[i] += activity_array[i]
                    i += 1
                end
            end
        end
        return result_array
    end


    def check_range(start_date,end_date,record)
        ((start_date..end_date) === record.date)
    end

end