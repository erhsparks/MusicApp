class UsersController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #login stuff here

      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages

      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    render :profile_page
  end
end
