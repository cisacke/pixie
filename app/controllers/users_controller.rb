class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    if params[:id]

    else
      render json: current_user
    end
  end

  private

    def user_params
      params.require(:user).permit(:f_name, :l_name, :email, :password)
    end

end
