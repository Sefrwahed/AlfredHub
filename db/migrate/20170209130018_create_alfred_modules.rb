class CreateAlfredModules < ActiveRecord::Migration[5.0]
  def change
    create_table :alfred_modules do |t|
      t.string :name
      t.string :license
      t.string :homepage
      t.text :description

      t.timestamps
    end
  end
end
