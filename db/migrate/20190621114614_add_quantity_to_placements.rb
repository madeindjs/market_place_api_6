class AddQuantityToPlacements < ActiveRecord::Migration[6.0]
  def change
    add_column :placements, :quantity, :integer, default: 0
  end
end
