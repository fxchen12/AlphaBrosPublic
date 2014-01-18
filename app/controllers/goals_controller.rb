class GoalsController < ApplicationController

    def index
      @workouts=Workout.all
    end
end