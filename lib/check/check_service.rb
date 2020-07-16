module Check
  class CheckService
    def initialize(check_client)
      @check_client = check_client
    end

    def create_check(description:, amount:, recipient:)
      check_client.create_check(description: description, amount: amount, recipient: recipient)
    end

    private

    attr_reader :check_client
  end
end
