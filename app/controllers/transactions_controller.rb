class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
    end
    def new
        @transaction = Transaction.new
    end
    def create
        @account = Account.find(params[:account_id])
        @transaction = @account.transactions.create(transaction_params)
        
        if @transaction.save
            
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
