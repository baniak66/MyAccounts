class AccountsController < ApplicationController

  expose(:account, attributes: :account_params)
  expose(:accounts)

  def index
  end

  def show
  end

  def new
  end

  def create
    if account.save
      redirect_to accounts_path, notice: 'Account was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if account.update(account_params)
      redirect_to accounts_path, notice: 'Account was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def account_params
      params.require(:account).permit(:number, :accounttype, :name)
    end
end
