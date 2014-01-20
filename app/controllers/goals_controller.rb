class GoalsController < ApplicationController

    def index
      @workouts=Workout.all
      @goal=Goal.new
    end

    def create
      @goal = Goal.new(goal_params)
      @goal.user_id = current_user.id

      if @goal.save
        flash[:success] = "New goal set!"
        redirect_to goals_url
      end
    end

    private

      def goal_params
        params.require(:goal).permit(:number, :metric, :time_range, :workout_id)
      end
end