class RemovePriceFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :price, :integer
  end
end
