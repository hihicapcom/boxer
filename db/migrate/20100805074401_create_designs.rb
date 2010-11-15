class CreateDesigns < ActiveRecord::Migration
  def self.up
    create_table :designs do |t|
      t.string :title, :limit=>200
      t.string :keyword, :limit=>50
      t.text :plan
      t.text :stepes
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :analysis_id

      t.timestamps
    end
  end

  def self.down
    drop_table :designs
  end
end
