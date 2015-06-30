class RenameTable < ActiveRecord::Migration
  def change
    rename_table("link_objects", "posts")
  end
end
