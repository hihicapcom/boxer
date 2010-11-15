class CreateDemands < ActiveRecord::Migration
  def self.up
    create_table :demands do |t|
      t.string :title, :limit=>200
      t.string :keyword, :limit=>50
      t.text :content
      t.string :department,:limit=>200
      t.string :businessman,:limit=>200
      t.datetime :created_at
      t.integer :user_id
      t.datetime :updated_at
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :demands
  end
end
