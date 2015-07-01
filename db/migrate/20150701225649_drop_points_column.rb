class DropPointsColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :points, :integer
  end
end
