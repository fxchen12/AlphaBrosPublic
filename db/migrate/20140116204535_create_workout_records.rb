class CreateWorkoutRecords < ActiveRecord::Migration
  def change
    create_table :workout_records do |t|
      t.references :user, index: true
      t.references :workout, index: true
      t.integer :duration
      t.integer :distance

      t.timestamps
    end
  end
end
