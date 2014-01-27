class ChangeDataTypeForDate < ActiveRecord::Migration
  def change
    remove_column :workout_records,:date
    add_column :workout_records, :date, :date
  end
end
