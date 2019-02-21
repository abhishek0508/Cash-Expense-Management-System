# class for handling transactions of user
# frozen_string_literal: true

class TransactionsController < ApplicationController

  before_action :authenticate_user
  def index
    @transactions = Transaction.all
    @account = Account.find(params[:account_id])
    @user = current_user
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
    @user = current_user
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(transaction_params)
      redirect_to user_account_transactions_path
    else
      render 'edit'
    end
  end

  def show
    # Not of work
  end

  def approve
    @transaction = Transaction.find(params[:transaction_id])
    @transaction.approve = true
    @transaction.save
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :description, :image)
  end
end
