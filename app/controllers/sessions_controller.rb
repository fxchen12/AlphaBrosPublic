class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:create]

    def create
        jump_to_dashboard
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in user
            flash[:success] = 'Welcome back!'
            redirect_to '/workouts'
        else
            flash[:error] = 'Invalid email/password combination'
            redirect_to root_url
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end
end
