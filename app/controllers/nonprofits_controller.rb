class NonprofitsController < ApplicationController
  def index
    render json: Nonprofit.all
  end

  def update
    nonprofit = find_nonprofit

    if nonprofit.update(nonprofit_params)
      head :no_content
    else
      render json: nonprofit.errors, status: :unprocessable_entity
    end
  end

  private

  def find_nonprofit
    Nonprofit.find(params[:id])
  end

  def nonprofit_params
    params.require(:nonprofit).permit(:address_1, :address_2, :city, :state, :zip)
  end
end
