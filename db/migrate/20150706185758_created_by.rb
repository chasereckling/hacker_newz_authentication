class CreatedBy < ActiveRecord::Migration
  def change
    add_column :posts, :created_by, :string
  end
end
