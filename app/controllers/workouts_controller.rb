class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      redirect_to @workout, notice: 'Workout was successfully created.'
    else
      render 'new'
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
      p = params.require(:workout).permit(:name, :duration, :notes, :type)
      # Check if distance was specified instead of duration
      # And modify values accordingly before returning
      if p[:type] == 'Distance'
        p[:distance] = p[:duration]
        p[:duration] = nil
      end
      return p
    end
    
end
