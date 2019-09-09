class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '登録しました'
      redirect_to @user
    else
      flash.now[:danger] = '登録出来ませんでした'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.uniq
    @count_have = @user.have_items.count
    @count_want = @user.want_items.count
  end

  def new
   @user = User.new
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
