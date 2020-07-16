class CheckTransactionsController < ApplicationController
  def send_check
    check_transaction = CheckTransaction.find(params[:id])

    Checks.service.create_check(check_transaction)

    head :no_content
  rescue StandardError
    head :unprocessable_entity
  end
end
