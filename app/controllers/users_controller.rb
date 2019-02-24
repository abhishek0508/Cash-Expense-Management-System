# frozen_string_literal: true
# Users class for creating new users

class UsersController < ApplicationController
  before_action :already_login
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_accounts_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
       params.require(:user).permit(:name, :emailId, :password, :password_confirmation, :admin)
  end
end
