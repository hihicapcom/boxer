class CreateModules < ActiveRecord::Migration
  def self.up
    create_table :modules do |t|
      t.string :name,:limit=>200
      t.text :description
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :modules
  end
end
