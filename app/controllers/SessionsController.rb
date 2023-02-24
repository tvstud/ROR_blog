class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        # Successful login
        session[:user_id] = user.id
        redirect_to root_path
      else
        # Unsuccessful login
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end
  