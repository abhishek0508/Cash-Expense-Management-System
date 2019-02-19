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
            redirect_to @user
        end
    end
    def show
        @account = current_user.accounts.find(params[:name])
        
    end
    def edit
        @account = Account.find(params[:id])
    end
    def update
        @user = current_user
        @account = Account.find(params[:id])
        if @account.update(account_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    private
    def account_params
        params.require(:account).permit(:name)
    end
    
end
