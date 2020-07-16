class NonprofitsController < ApplicationController
  def index
    render json: find_nonprofits, include: :draft_check_transaction
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

  def find_nonprofits
    Nonprofit
      .includes(:check_transactions)
      .joins('INNER JOIN check_transactions ON nonprofits.id = check_transactions.nonprofit_id')
      .where(check_transactions: { status: :draft })
      .alphabetical
  end

  def find_nonprofit
    Nonprofit.find(params[:id])
  end

  def nonprofit_params
    params.require(:nonprofit).permit(:address_1, :address_2, :city, :state, :zip)
  end
end
