class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    if @user = User.find_by(:id => params[:id])
      render :show
    end
  end

  def new
    @user = User.new
    render :new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_path, :flash => {:errors => @user.errors.full_messages}
    end
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
