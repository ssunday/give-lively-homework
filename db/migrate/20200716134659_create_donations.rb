class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.decimal :amount, precision: 19, scale: 4
      t.datetime :initiated_at
      t.datetime :processed_at
      t.belongs_to :nonprofit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
