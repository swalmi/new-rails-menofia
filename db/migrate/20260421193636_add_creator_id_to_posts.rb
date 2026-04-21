class AddCreatorIdToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :creator_id, :integer
  end
end
