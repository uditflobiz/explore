class AddAuthorId < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :author, null: false
  end
end
