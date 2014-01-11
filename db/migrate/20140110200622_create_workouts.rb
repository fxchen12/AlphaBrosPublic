class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :distance
      t.integer :duration
      t.integer :reps
      t.text :notes
      t.string :type

      t.timestamps
    end
  end
end
