class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user_params = params.require(:user).permit(:username, :email, :password, :password_confirmation)
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      #UserMailer.confirm(@user).deliver_now
      redirect_to new_user_path, success: 'Votre compte a bien été créé, vous devriez recevoir une email de confirmation.'
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end