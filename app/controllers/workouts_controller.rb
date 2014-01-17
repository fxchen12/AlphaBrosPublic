class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all
    @workout = Workout.new
    @workout_record = WorkoutRecord.new
  end

  def show
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to workouts_url, notice: 'New workout added!'
    else
      flash[:error] = "Workout failed to save."
      render 'workouts'
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: 'Workout was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_url
  end

  private

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:name, :notes)
    end

end
