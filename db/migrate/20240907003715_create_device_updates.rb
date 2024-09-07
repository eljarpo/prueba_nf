class CreateDeviceUpdates < ActiveRecord::Migration[7.2]
  def change
    create_table :device_updates do |t|
      t.references :device, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
