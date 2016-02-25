class DecreesController < ApplicationController

  expose(:decree, attributes: :decree_params)
  expose(:evidence)

  def create
    decree.evidence_id = params[:evidence_id]
    decree.decreetype = params[:decreetype]
    respond_to do |format|
      if decree.save
        format.html {redirect_to evidence, notice: 'Decree was successfully created.'}
        format.js {}
      else
        format.html {render 'evidences/show'}
        format.js {}
      end
    end
  end

  def destroy
    if decree.destroy
      respond_to do |format|
        format.js {}
      end
    end
  end

  private

    def decree_params
      params.require(:decree).permit(:amount, :decreetype, :evidence_id, :account_id)
    end
end
