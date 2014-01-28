class ChangeDistanceToDecimalInWorkoutRecords < ActiveRecord::Migration
  def change
    change_column :workout_records, :distance, :decimal
  end
end
