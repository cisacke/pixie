class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Photostream.create!(user_id: @user.id)
      sign_in!(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def current_user
    @user = current_users
    render :show
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

    def user_params
      params.require(:user).permit(:f_name, :l_name, :email, :password)
    end

end
