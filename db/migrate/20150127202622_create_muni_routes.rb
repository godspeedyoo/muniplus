class CreateMuniRoutes < ActiveRecord::Migration
  def change
    create_table :muni_routes do |t|
      t.integer :route_number
      t.string :data

      t.timestamps
    end
  end
end
