class WorkoutRecordsController < ApplicationController

  def create
    @workout_record = WorkoutRecord.new(workout_record_params)

    if @workout_record.save
      flash[:success] = "New workout record added!"
      redirect_to workouts_url
    else
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
