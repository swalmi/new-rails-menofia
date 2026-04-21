class AddDestroyerIdToPost < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :destroyer, :integer
  end
end
