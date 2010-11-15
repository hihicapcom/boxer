class CreateAnalyses < ActiveRecord::Migration
  def self.up
    create_table :analyses do |t|
      t.string :title, :limit=>200
      t.string :keyword, :limit=>50
      t.text :content
      t.text :reference
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :demand_id

      t.timestamps
    end
  end

  def self.down
    drop_table :analyses
  end
end
