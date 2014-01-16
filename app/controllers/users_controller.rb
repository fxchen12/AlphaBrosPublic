class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            flash[:success] = "Your account has been created!"
            redirect_to '/workouts'
        else
            flash[:error] = "Registration failed."
            redirect_to root_url
        end
    end

    def edit
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(update_params)
            # Yay!
            redirect_to '/workouts'
        else
            # Boooo
            render :edit
        end
    end

    def show
        @user = User.find(params[:id])
        #redirect_to root unless current_user == @user
    end

    private

        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end

        def update_params
            params.require(:user).permit(:password, :password_confirmation)
        end

end