class RemoveAchievementsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :achievements
  end
end
