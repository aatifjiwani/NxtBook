class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      respond_with_error("Invalid User ID")
    else
      if params[:filter].present?
      render_user_books
      else
        render json: @user, status: :ok
      end
    end
  end
  
  def render_user_books
    render(json: {
      selling_books: @user.selling_books.as_json,  
      bought_books: @user.bought_books.as_json,
      pending_books: @user.pending_books.as_json,
      sold_books: @user.sold_books.as_json
      }, status: :ok)
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