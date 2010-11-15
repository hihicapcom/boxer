class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name, :limit=>200
      t.text :description


      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
