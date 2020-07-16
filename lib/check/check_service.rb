module Check
  class CheckService
    def initialize(check_client)
      @check_client = check_client
    end

    def create_check(check_transaction)
      nonprofit = check_transaction.nonprofit

      check_client.create_check(
        description: "#{nonprofit.name} - #{check_transaction.initiated_at}",
        amount: check_transaction.amount,
        recipient: nonprofit
      )

      check_transaction.update!(status: :sent, sent_at: Time.now.utc)
    end

    private

    attr_reader :check_client
  end
end
