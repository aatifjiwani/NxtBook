class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      respond_with_error("Invalid User ID")
    else
      render json: @user, status: :ok
    end
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.nil?
      respond_with_error("Invalid User ID")
    else
      if @user.update(update_params)
        render json: @user, status: :ok
      else
        respond_with_error("Unable to update user")
      end
    end
  end
  
  
  def update_params
    params.require(:user).permit(:profilepicture, :password, :password_confirmation)
  end
end