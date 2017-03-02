class AddUserIdToAlfredModules < ActiveRecord::Migration[5.0]
  def change
    change_table :alfred_modules do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
