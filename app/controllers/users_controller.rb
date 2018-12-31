class UsersController < ApplicationController
    def index
    end
    def new
        @user = User.new
    end
    def create 
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to @user
        else
            render 'new'
        end
    end
    def show
        @user = User.find(params[:id])
        @accounts = current_user.accounts.all
        @account = Account.new
    end
    private 
    def user_params
       params.require(:user).permit(:name,:emailId,:password,:password_confirmation) 
    end

    
end
