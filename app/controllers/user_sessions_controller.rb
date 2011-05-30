class UserSessionsController < ApplicationController
  respond_to :html, :xml
  def new
    @user_session = UserSession.new
   respond_with @user_session
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path, :notice => "You are now logged in as #{@user_session.user.login}"
    end
  end
end

