class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
        @account = Account.find(params[:account_id])
        @user = current_user
        @admin = current_user.admin
        if @admin
            @transact = Transaction.all
        else
            @transact = @account.transactions
        end
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
    def edit
       
    end
    def update
        @user = current_user
    end
    def show
    end

    def approve
       @transaction = Transaction.find(params[:transaction_id])
       @transaction.approve = true
       @transaction.save    
    end

    def transaction_params
        params.require(:transaction).permit(:amount,:description,:image) 
     end
end
