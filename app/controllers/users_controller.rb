class UsersController < ApplicationController
  def index
    @users = User.all()
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if (Integer(user_params[:trained]) + Integer(user_params[:spy]) > @user.untrained)
      puts 'exited -- Too many units'
      redirect_to edit_user_path(@user) and return
    end
    temp_params = {untrained: 0, trained: (@user.trained + Integer(user_params[:trained])), spy: (@user.spy + Integer(user_params[:spy]))}
    temp_params[:untrained] = @user.untrained - (Integer(user_params[:trained]) + Integer(user_params[:spy]))
    @user.update(temp_params)
    redirect_to edit_user_path(@user)
  end

  def attack
    @you = current_user
    @target = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :trained, :untrained, :spy)
  end
end
