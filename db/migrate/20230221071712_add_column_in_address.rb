class AddColumnInAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :author, null: false
  end
end
