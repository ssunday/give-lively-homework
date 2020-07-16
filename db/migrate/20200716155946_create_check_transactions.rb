class CreateCheckTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :check_transactions do |t|
      t.belongs_to :nonprofit, null: false, foreign_key: true
      t.decimal :amount, precision: 19, scale: 4
      t.integer :status
      t.datetime :initiated_at
      t.datetime :sent_at

      t.timestamps
    end
  end
end
