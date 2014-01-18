class WorkoutRecordsController < ApplicationController

  def index
    @workouts = current_user.workouts
  end

  def create
    @workout_record = WorkoutRecord.new(workout_record_params)

    if @workout_record.save
      flash[:success] = "New workout record added!"
      redirect_to workouts_url
    else
      flash[:error] = @workout_record.errors.full_messages[0].split(' ')[1..-1].join(' ')
      redirect_to workouts_url
    end
  end

  def destroy
    @workout_record.destroy
    redirect_to workouts_url
  end

  private

  def workout_record_params
    params.require(:workout_record).permit(:duration, :distance, :workout_id)
  end
end
