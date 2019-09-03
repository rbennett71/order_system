class AddAllocationNoteToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :allocation_note, :string
  end
end
