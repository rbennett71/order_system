class RenameVendorTableToVendor < ActiveRecord::Migration[5.2]
  def change
    rename_table :vendor_tables, :vendors
  end
end
