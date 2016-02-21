class DecreesController < ApplicationController

  expose(:decree, attributes: :decree_params)
  expose(:evidence)

  def create
    decree.evidence_id = params[:evidence_id]
    decree.decreetype = params[:decreetype]
    if decree.save
      redirect_to evidence, notice: 'Decree was successfully created.'
    else
      render action: 'show'
    end
  end


  private

    def decree_params
      params.require(:decree).permit(:amount, :decreetype, :evidence_id, :account_id)
    end
end
