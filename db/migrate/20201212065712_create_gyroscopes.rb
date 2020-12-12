class CreateGyroscopes < ActiveRecord::Migration[5.2]
  def change
    create_table :gyroscopes do |t|
      t.string :name
      t.integer :x, default: 0
      t.integer :y, default: 0
      t.integer :z, default: 0

      t.references :drone, foreign_key: true
      
      t.timestamps
    end
  end
end
