class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # Yay! successful!
            redirect_to root
        else
            # Boooooo
            render :new
        end
    end

    def edit
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(update_params)
            # Yay!
            redirect_to root
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