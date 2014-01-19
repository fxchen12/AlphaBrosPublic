class ChangeFieldsOfGoals < ActiveRecord::Migration
  def change
    change_table :goals do |t|
      t.rename :distance, :number
      t.rename :type, :metric
      t.remove :duration
      t.string :time_range
    end
  end
end
