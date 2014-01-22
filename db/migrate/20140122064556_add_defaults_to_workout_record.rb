class AddDefaultsToWorkoutRecord < ActiveRecord::Migration
  def change
    change_column_default :workout_records, :duration, 0
    change_column_default :workout_records, :distance, 0
  end
end
