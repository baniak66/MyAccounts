class ContractorsController < ApplicationController

  expose(:contractor, attributes: :contractor_params)
  expose(:contractors)

  def index
  end

  def new
  end

  def create
    if contractor.save
      redirect_to contractors_path, notice: 'Contractor was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    def contractor_params
      params.require(:contractor).permit(:name, :address, :nip)
    end

end

