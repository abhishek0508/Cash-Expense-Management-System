class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
    end
    def new
        @transaction = Transaction.new
    end
    def create
        @user = current_user
        @account = Account.find(params[:account_id])
        @transaction = @account.transactions.create(transaction_params)
        
        if @transaction.save
            redirect_to user_account_transactions_path
        else
            render 'new'
        end
    end
    def show
    end
    def transaction_params
        params.require(:transaction).permit(:amount,:description,:image) 
     end
end
