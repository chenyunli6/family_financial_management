class AddIsHiddenToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :is_hidden, :boolean, default: false
  end
end
