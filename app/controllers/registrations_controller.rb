class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to new_login_path
    else 
      flash[:alert] = "Couldn't save the user."
      render :new, status: :unprocessable_entity
    end 
  end


  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end