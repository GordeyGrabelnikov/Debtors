class CreateDebtors < ActiveRecord::Migration[5.2]
  def change
    create_table :debtors do |t|
      t.string :first_name
      t.string :last_name
      t.string :image_url

      t.timestamps
    end
  end
end
