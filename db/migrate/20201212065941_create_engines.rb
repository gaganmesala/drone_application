class CreateEngines < ActiveRecord::Migration[5.2]
  def change
    create_table :engines do |t|
      t.string :name
      t.integer :power_indicator
      t.string :status, default: 'off'

      t.references :drone, foreign_key: true

      t.timestamps
    end
  end
end
