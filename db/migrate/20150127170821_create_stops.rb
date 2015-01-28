class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :tag
      t.decimal :lat
      t.decimal :lon
      t.belongs_to :route
    end
  end
end
