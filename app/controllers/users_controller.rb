class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    puts params.to_yaml
  end
  def new
    @user = User.new
    # debugger
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
    # debugger
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
