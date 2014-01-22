module GoalsHelper

  def get_current_progress(goal)
    i = 0
    if goal.metric == "miles"
      i += 5
    end
    if goal.time_range == "week"
      i += 1
    elsif goal.time_range == "month"
      i += 2
    elsif goal.time_range == "year"
      i += 3
    end
    current_progress = 0
    record_totals.each do |w,a|
      if w == goal.workout
        if a[i] >= goal.number
          current_progress = 100
        else
          current_progress = (100 * a[i].to_f / goal.number.to_f).to_i
        end
      end
    end
    return current_progress

  end
end
