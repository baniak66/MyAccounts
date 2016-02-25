class ContractorsController < ApplicationController

  expose(:contractor, attributes: :contractor_params)
  expose(:contractors)
  expose(:evidences)
  expose(:evidence)

  def index
  end

  def show
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

  def create_evidence
    if contractor.save
      redirect_to evidence_path(contractor.evidences.first), notice: 'Evidence was successfully created.'
    else
      render 'evidences/index'
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

