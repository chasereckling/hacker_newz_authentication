class AddComments < ActiveRecord::Migration
  def change
    create_table :comments, force: :cascade do |t|
      t.string :text
      t.string :author
      t.integer :points, default: 0
      t.integer :post_id

      t.timestamps
    end
  end
end
