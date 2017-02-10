class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.string :number
      t.integer :download_count, default: 0
      t.integer :alfred_module_id, null: false

      t.timestamps
    end
  end
end
