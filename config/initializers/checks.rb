require 'check/lob_client'
require 'check/mock_client'
require 'check/check_service'

module Checks
  def self.service
    @service ||= Check::CheckService.new(Rails.env.production? ? Check::LobClient.new : Check::MockClient.new)
  end
end
