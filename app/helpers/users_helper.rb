module UsersHelper
  def current_workout
      if (current_user.current_workout_id != nil)
        return Workout.find(current_user.current_workout_id)
      else
        return nil
      end
  end
end