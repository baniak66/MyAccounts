class EvidencesController < ApplicationController

  expose(:evidence, attributes: :evidence_params)
  expose(:evidences)
  expose(:contractor)
  expose(:decree) {Decree.new}

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

  private

    def evidence_params
      params.require(:evidence).permit(:number, :madedate, :amount, :description, :contractor_id, :accept)
    end
end
