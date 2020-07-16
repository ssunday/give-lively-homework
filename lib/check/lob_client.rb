module Check
  class LobClient
    FROM = 'foobar'.freeze
    BANK_ACCOUNT = 'BANK'.freeze

    def create_check(description:, amount:, recipient:)
      lob.checks.create(
        description: description,
        bank_account: BANK_ACCOUNT, # define somehow,
        to: format_to(recipient),
        from: FROM, # define somehow,
        amount: amount
      )
    end

    private

    def format_to(recipient)
      {
        name: recipient.name,
        address_line1: recipient.address_1,
        address_line2: recipient.address_2,
        address_city: recipient.city,
        address_state: recipient.state,
        address_zip: recipient.zip
      }
    end

    def lob
      @lob ||= Lob::Client.new(api_key: 'API_KEY')
    end
  end
end
