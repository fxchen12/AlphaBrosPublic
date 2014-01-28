class AchievementsController < ApplicationController

    def index
        all_achievements = []
        # Normal way of assigning list doesn't work.
        Merit::Badge.all.each do |b|
            all_achievements << b
        end
        @user_achievements = current_user.badges
        @name = :Firsts
        if params[:category]
            @name = params[:category][:name]
        end
        @achievements = all_achievements.select {|a| a.custom_fields[:cat] == @name.to_sym}
    end
end