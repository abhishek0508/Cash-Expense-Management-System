class SessionsController < ApplicationController
  # before_action :already_login, except: :destroy
  def new

  end
  def create
    user = User.find_by(emailId: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to user_accounts_path(user)
    else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
  def show
  end
end
