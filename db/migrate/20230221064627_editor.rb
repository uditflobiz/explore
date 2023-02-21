class Editor < ActiveRecord::Migration[6.0]
  def change
    create_table :editors do |t|
      t.string :name
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
