class EvidencesController < ApplicationController

  expose(:evidence, attributes: :evidence_params)
  expose(:evidences)
  expose(:contractor)
  expose(:decree) {Decree.new}

  before_action :check_decrees, only: :destroy

  def show
  end

  def create
    if evidence.save
      redirect_to evidence, notice: 'Evidence was successfully created.'
    else
      render action: 'index'
    end
  end

  def accept
    evidence = Evidence.find(params[:id])
    evidence.accept = true
    evidence.save
    if evidence.save
      redirect_to evidence, notice: 'Decree accepted!'
    end
  end

  def edit
    contractor = Contractor.find(params[:contractor_id])
  end

  def update
    if evidence.update(evidence_params)
      redirect_to evidence, notice: 'Evidence changed.'
    else
      render 'edit'
    end
  end

  def destroy
    if evidence.destroy
      redirect_to evidences_path, notice: 'Evidence deleted.'
    end
  end

  private

    def evidence_params
      params.require(:evidence).permit(:number, :madedate, :amount, :description, :contractor_id, :accept)
    end

    def check_decrees
      unless evidence.decrees.empty?
        redirect_to evidence_path, flash: {error: 'Evidence has decrees, so You can not delete it.'}
      end
    end
end
