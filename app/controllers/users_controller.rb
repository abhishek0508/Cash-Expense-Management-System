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
        @accounts = current_user.accounts.all
       
    end
    private 
    def user_params
       params.require(:user).permit(:name,:emailId,:password,:password_confirmation) 
    end

    
end
