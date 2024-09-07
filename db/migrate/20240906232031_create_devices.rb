class CreateDevices < ActiveRecord::Migration[7.2]
  def change
    create_table :devices do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :name
      t.integer :type
      t.integer :status

      t.timestamps
    end
  end
end
