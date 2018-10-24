class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      respond_with_error("Invalid User ID")
    else
      render json: @user, status: :ok
    end
  end
end