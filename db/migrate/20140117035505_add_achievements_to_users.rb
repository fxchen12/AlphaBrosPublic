class AddAchievementsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :achievements, :text
  end
end
