class CreateDocs < ActiveRecord::Migration
  def self.up
    create_table :docs do |t|
      t.string :filename, :limit=>200
      t.string :disk_filename, :limit=>1000
      t.text :description
      t.string :digest
      t.integer :filesize,:default => 0, :null => false
      t.integer :downloads,:default => 0, :null => false
      t.integer :user_id
      t.datetime :created_at
      t.integer :category_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :docs
  end
end
