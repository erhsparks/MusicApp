class UsersController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)

      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages

      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    if current_user && @user.id == current_user.id
      render :profile_page
    else
      render :forbidden
    end
  end
end
