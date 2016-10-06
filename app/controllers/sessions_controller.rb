class SessionsController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    search_result = User.find_by_credentials(user_params)

    if search_result.is_a?(User)
      user = search_result
      login_user!(user)

      redirect_to user_url(user)
    else
      @user = User.new(user_params)
      flash.now[:errors] = search_result

      render :new
    end
  end

  def destroy
    logout_user!

    redirect_to new_session_url
  end
end
