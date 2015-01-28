class CreateMuniRoutes < ActiveRecord::Migration
  def change
    create_table :muni_routes do |t|
      t.integer :tag
      t.string :title

      t.timestamps
    end
  end
end
