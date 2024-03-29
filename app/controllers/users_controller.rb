class UsersController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to user_path(current_user)
    end
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'successfully'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
