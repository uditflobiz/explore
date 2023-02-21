class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
