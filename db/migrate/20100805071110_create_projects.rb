class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name, :limit=>200
      t.datetime :created_at
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
