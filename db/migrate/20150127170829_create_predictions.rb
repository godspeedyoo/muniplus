class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :seconds

      t.timestamps
    end
  end
end
