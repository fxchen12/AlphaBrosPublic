class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user
      t.references :workout
      t.integer :distance
      t.integer :duration
      t.string :type

      t.timestamps
    end
  end
end
