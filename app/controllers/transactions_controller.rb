# class for handling transactions of user
# frozen_string_literal: true

class TransactionsController < ApplicationController

  before_action :authenticate_user, except: :approve
  def index
    @transactions = Transaction.all
    @account = Account.find(params[:account_id])
    @admin = current_user.admin
    @transact = @account.transactions
  end
    
  def new
    @transaction = Transaction.new
  end

  def create
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.create(transaction_params)
    if @transaction.save
      redirect_to user_account_transactions_path
    else
      render 'new'
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.find(params[:id])
    if @transaction.update_attributes(transaction_params)
      flash[:success] = "Document Updated"
      redirect_to user_account_transactions_path
    else
      render 'edit'
    end
  end

  def show
    # Not of work
  end

  def approve
    @account = Account.find(params[:account_id])
    @transaction = Transaction.find(params[:transaction_id])
    if params[:approved] == 'yes'
      @transaction.approve = true
      flash[:success] = "Transaction Approved"
    else
      @transaction.approve = false
      flash[:success] = "Transaction Disapproved"
    end
    @transaction.save
    redirect_to user_account_transactions_path(current_user, @account)
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :description, :image)
  end
end
