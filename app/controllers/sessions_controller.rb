class SessionsController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    search_result = User.find_by_credentials(user_params)

    if search_result.is_a?(User)
      @user = search_result

      redirect_to user_url(@user)
    else
      error_message = search_result
      flash.now[:errors] = error_message

      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
  end
end
