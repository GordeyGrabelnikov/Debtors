class RemoveImageUrlFromDebtors < ActiveRecord::Migration[5.2]
  def change
    remove_column :debtors, :image_url, :string
  end
end
