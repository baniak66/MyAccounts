class ContractorsController < ApplicationController

  expose(:contractor, attributes: :contractor_params)
  expose(:contractors)


  def index
  end

  def show
  end

  def new
  end

  def create
    if contractor.save
      if contractor.evidences.count == 1
        redirect_to evidence_path(contractor.evidences.first), notice: 'Evidence was successfully created.'
      else
        redirect_to contractors_path, notice: 'Contractor was successfully created.'
      end
    else
      render action: 'new'
    end
  end

  def update
    if contractor.update(contractor_params)
      redirect_to contractors_path, notice: 'Contractor was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def contractor_params
      params.require(:contractor).permit(:name, :address, :nip,
        evidences_attributes: [:number, :madedate, :amount, :description, :contractor_id])
    end

end

