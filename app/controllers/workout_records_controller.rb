class WorkoutRecordsController < ApplicationController

  def index
    @workouts = current_user.workouts
  end

  def create
    @workout_record = WorkoutRecord.new(workout_record_params)
    @workout_record.user_id = current_user.id
    
    if @workout_record.save and @workout_record.workout.user == current_user
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
