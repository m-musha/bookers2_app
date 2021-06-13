class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def following
    @user = User.find(params[:id])
    @users = @user.following_user
  end 
  
  def follower
    @user = User.find(params[:id])
    @users = @user.follower_user
  end 
  
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end 
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end 
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else 
      render :edit
    end 
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "The tournament is complete."
    redirect_to "/"
  end

  
  private
   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end 
end
