class AddColumnInComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :commenter, polymorphic: true
  end
end
