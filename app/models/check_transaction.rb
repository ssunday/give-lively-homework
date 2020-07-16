class CheckTransaction < ApplicationRecord
  enum status: { draft: 0, sent: 1, processed: 2 }

  belongs_to :nonprofit
end
