class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :tag
      t.string :title
      t.string :direction

      t.timestamps
    end
  end
end
