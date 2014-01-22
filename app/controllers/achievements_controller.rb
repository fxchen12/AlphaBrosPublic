class AchievementsController < ApplicationController

    def index
        @achievements = []
        # Normal way of assigning list doesn't work.
        Merit::Badge.all.each do |b|
            @achievements << b
        end
        @user_achievements = current_user.badges
    end
end