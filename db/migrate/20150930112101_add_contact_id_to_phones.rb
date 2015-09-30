class AddContactIdToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :contact_id, :integer
  end
end
