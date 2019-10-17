class UsersController < ApplicationController
  skip_before_action :method_name, raise: false
  before_action :authenticate_user!, raise: false

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id)
  end

  # def edit
  #   if current_user == @user
  #     @user = User.find(params[:id])
  #   end
  # end

  def edit
      @user = User.find(params[:id]) if current_user
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update!(user_params)
        redirect_to @user
      else
        render :edit
      end
    end
  end

  def followee
  end

  def follower
  end

private

def user_params
  params.require(:user).permit(:username, :password, :password_confirmation, :bio)
end
end
