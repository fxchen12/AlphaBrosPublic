class AddCurrentWorkoutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_workout_id, :integer
  end
end
