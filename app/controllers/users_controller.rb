class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :jump_to_dashboard, only: [:new, :create]

    # Root page
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            flash[:success] = "Your account has been created!"
            redirect_to '/dashboard'
        else
            flash[:error] = "Invalid registration, please try again."
            render :new
        end
    end

    # User settings page
    def show
        @user = current_user
    end

    def update
        @user = current_user
        ignore_flash = false
        # Check if only updating user's current workout
        if params[:current_workout_id] != nil
            ignore_flash = true
        end
        if @user.update(update_params)
            if !ignore_flash
                flash[:success] = "Your changes have been applied!"
            end
            redirect_to(:back)
        else
            render :show
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :time_zone)
        end

        def update_params
            params.require(:user).permit(:name, :password, :password_confirmation, :time_zone, :current_workout_id)
        end
end