class GoalsController < ApplicationController

    def index
      @workouts=Workout.all
      @goal=Goal.new
    end

    def create
      @goal = Goal.new(goal_params)
    end

    private

      def goal_params
        params.require(:goal).permit(:number, :metric, :time_range)
      end
end