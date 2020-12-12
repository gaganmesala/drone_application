class CreateOrientationSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :orientation_sensors do |t|
      t.string :name
      t.string :pitch
      t.string :roll

      t.references :drone, foreign_key: true

      t.timestamps
    end
  end
end
