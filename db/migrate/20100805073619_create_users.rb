class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit=>64, :null=>false
      t.string :realname, :limte=>200, :null=>false
      t.string :hashed_password, :limit=>64
      t.string :email, :limit=>128
      t.string :telephone, :limit=>50
      t.string :department, :limt=>200
      t.string :post, :limit=>6
      t.boolean :enabled, :default=>true, :null=>false
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
