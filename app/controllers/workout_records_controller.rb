class WorkoutRecordsController < ApplicationController

  def create
    @workout_record = WorkoutRecord.new(workout_record_params)

    if @workout_record.save
      redirect_to workouts_url, notice: 'New workout record added!'
    else
      flash[:error] = "Workout record failed to save."
      render 'workouts'
    end
  end

  def destroy
    @workout_record.destroy
    redirect_to workouts_url
  end

  private

  def workout_record_params
    params.require(:workout_record).permit(:duration, :distance)
  end
end
