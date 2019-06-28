class CreateDebits < ActiveRecord::Migration[5.2]
  def change
    create_table :debits do |t|
      t.references :debtor, foreign_key: true
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end
