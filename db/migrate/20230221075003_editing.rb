class Editing < ActiveRecord::Migration[6.0]
  def change
    create_table :editings do |t|
      t.belongs_to :editor
      t.belongs_to :author
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
