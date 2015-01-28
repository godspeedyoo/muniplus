class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :tag
      t.string :title
      t.decimal :lat
      t.decimal :lon
      t.decimal :stopId
      t.integer :route_tag
      t.string :direction
      t.belongs_to :route

      t.timestamps
    end
  end
end
