class CreateCheckTransactionsDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :check_transactions_donations do |t|
      t.belongs_to :check_transaction, null: false, foreign_key: true
      t.belongs_to :donation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
