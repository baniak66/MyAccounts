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
    account.accounttype = params[:accounttype]
    if account.save
      redirect_to accounts_path, notice: 'Account was successfully created.'
    else
      render action: 'index'
    end
  end

  def update
    if account.update(account_params)
      redirect_to accounts_path, notice: 'Account was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if account.destroy
      redirect_to accounts_path, notice: 'Account was successfully deleted.'
    else
      redirect_to accounts_path, notice: 'Something went wrong.'
    end
  end

  def trial_balance
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Trial Balance (generated #{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")})",
          orientation: 'Landscape'
      end
    end
  end

  private
    def account_params
      params.require(:account).permit(:number, :accounttype, :name, :dt_opening, :ct_opening)
    end
end
