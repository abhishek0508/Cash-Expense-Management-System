class AccountsController < ApplicationController
    include SessionsHelper
    before_action :already_login
    def index
        @var = current_user.admin
        if @var
            @accounts = Account.all
        else
            @accounts = current_user.accounts.all
        end
        @consumer  = current_user
    end
    def new
        @account = Account.new
    end
    def create
        @user = current_user
        @account = @user.accounts.create(account_params)
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
            redirect_to user_accounts_path(@user)
        else
            render 'edit'
        end
    end
    def destroy 
        @user = current_user
        @account = Account.find(params[:id])
        if @account.destroy
            redirect_to user_accounts_path(@user)
        end
    end
    private
    def account_params
        params.require(:account).permit(:accname)
    end
    
end
