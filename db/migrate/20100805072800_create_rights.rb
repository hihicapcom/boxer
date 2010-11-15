class CreateRights < ActiveRecord::Migration
  def self.up
    create_table :rights do |t|
      t.string :name, :limit=>200
      t.integer :menu_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rights
  end
end
