class AccountsController < ApplicationController
    include SessionsHelper
    def index 
        @accounts = Account.new
    end
    def new
        @account = Account.new
    end
    def create
        @user = User.find(params[:user_id])
        @account = @user.accounts.new(account_params)

        if @account.save
            redirect_to @user
        else
            render 'new'
        end
    end
    def show
        @account = current_user.accounts.find(params[:name])
        
    end
    private
    def account_params
        params.require(:account).permit(:name)
    end
    
end
