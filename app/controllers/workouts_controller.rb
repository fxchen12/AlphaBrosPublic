class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workout = Workout.new
    @workout_record = WorkoutRecord.new
  end

  def show
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id

    if @workout.save
      current_user.update({:current_workout_id => @workout.id})
      redirect_to :back, notice: 'New workout added!'
    else
      flash[:error] = "Workout failed to save."
      redirect_to :back
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: 'Workout was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    current_user.workouts.delete(@workout)
    if current_user.workouts.empty?
      current_user.update({:current_workout_id => nil})
    else
      current_user.update({:current_workout_id => current_user.workouts[0].id})
    end
    redirect_to :back
  end

  private

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:name, :notes)
    end

end
