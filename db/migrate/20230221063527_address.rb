class Address < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :details
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
