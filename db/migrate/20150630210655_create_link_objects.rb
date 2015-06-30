class CreateLinkObjects < ActiveRecord::Migration
  def change
    create_table :link_objects do |t|
      t.column :title, :string
      t.column :url, :string
      t.column :points, :integer

      t.timestamps
    end
  end
end
