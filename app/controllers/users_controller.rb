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
        if @user.update(update_params)
            flash[:success] = "Your changes have been applied!"
            redirect_to '/settings'
        else
            render :show
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :time_zone)
        end

        def update_params
            params.require(:user).permit(:name, :password, :password_confirmation, :time_zone)
        end
end