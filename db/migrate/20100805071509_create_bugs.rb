class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
      t.string :title,:limit=>200
      t.string :keyword,:limit=>50
      t.text :content
      t.text :comment
      t.datetime :created_at
      t.integer :user_id
      t.integer :severity_id
      t.integer :frequency_id
      t.integer :unit_id
      t.integer :state_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bugs
  end
end
