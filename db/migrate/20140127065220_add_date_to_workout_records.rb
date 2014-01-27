class AddDateToWorkoutRecords < ActiveRecord::Migration
  def change
    add_column :workout_records, :date, :datetime
  end
end
