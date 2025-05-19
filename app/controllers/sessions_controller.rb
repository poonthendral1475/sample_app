class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      reset_session
      log_in(user)
      flash[:success] = "Login successful!"
      redirect_to user_path(user)
    else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Logout successful!"
    redirect_to root_path
  end

  end
