class AccountsController < ApplicationController
    include SessionsHelper
    def index
    end
    def new
        @account = current_user.new
    end
    def create
        @account = current_user.accounts.new(account_paramas)

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
