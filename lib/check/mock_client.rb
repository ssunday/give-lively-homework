module Check
  class MockClient
    def create_check(description:, amount:, recipient:)
      Rails.logger.debug(description)
      Rails.logger.debug(amount)
      Rails.logger.debug(recipient)
    end
  end
end
