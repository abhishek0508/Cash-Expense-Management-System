# class for handling acocunt name of users
# frozen_string_literal: true.
class AccountsController < ApplicationController
  before_action :authenticate_user
  def index
    @var = current_user.admin
      if @var
        @accounts = Account.all
      else
        @accounts = current_user.accounts.all
      end
    @consumer = current_user
  end
  
  def new
    @account = Account.new
  end
    
  def create
    @user = current_user
    @account = current_user.accounts.create(account_params)
    if @account.save
      # do nothing 
    else
      flash[:notice] = 'Account Name Error'
    end
    redirect_to @user
  end

  def show
    @account = current_user.accounts.find(params[:name])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to user_accounts_path(@user)
    else
      render 'edit'
    end
  end
 
  def destroy
    @account = Account.find(params[:id])
    if @account.destroy
      redirect_to user_accounts_path(@user)
      flash[:success] = 'Document has been deleted'
    else
      flash[:notice]  = 'Document cannot be deleted'
    end
  end

  private

  def account_params
    params.require(:account).permit(:accname)
  end
end
