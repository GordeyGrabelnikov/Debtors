class AddImageToDebtors < ActiveRecord::Migration[5.2]
  def change
    add_column :debtors, :image, :string
  end
end
