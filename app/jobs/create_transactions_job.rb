class CreateTransactionsJob < ApplicationJob
  def perform(start_date, end_date)
    Nonprofit.all.find_each do |nonprofit|
      donations = nonprofit.donations.where(processed_at: start_date...end_date)

      next unless donations.count.positive?

      CheckTransaction.create!(
        nonprofit: nonprofit,
        status: :draft,
        amount: donations.sum(:amount)
      )
    end
  end
end
