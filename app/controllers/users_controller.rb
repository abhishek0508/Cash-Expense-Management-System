class UsersController < ApplicationController
    def index
    end
    def new
    end
    def create 
        @user = User.new(user_params)
        @user.save
        redirect_to @user
    end
    def show
        @user = User.find(params[:id])
    end
    private 
    def user_params
       params.require(:user).permit(:name,:emailId) 
    end

    
end
