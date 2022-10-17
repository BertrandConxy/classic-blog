class AddDefaultValueToPostscount < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :posts_count, :integer, default: 0
  end
end
