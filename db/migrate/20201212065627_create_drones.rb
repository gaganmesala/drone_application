class CreateDrones < ActiveRecord::Migration[5.2]
  def change
    create_table :drones do |t|
      t.string :name
      t.string :colour
      t.string :status, default: 'off'

      t.timestamps
    end
  end
end
