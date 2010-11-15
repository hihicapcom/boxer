class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name,:limit=>200
      t.string :url,:limit=>2000
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
