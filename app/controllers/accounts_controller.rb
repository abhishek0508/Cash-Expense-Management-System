class AccountsController < ApplicationController
    include SessionsHelper
    def index
    end
    def new
        @account = Account.new
    end
    def create
        @user = User.find(params[:user_id])
        @account = @user.accounts.create(account_paramas)

        if @account.save
            
        else
            render 'new'
        end
    end
    def show
        @account = current_user.accounts.find(params[:name])
    end
    private
    def account_paramas
        params.require(:account).permit(:name)
    end
    
end
