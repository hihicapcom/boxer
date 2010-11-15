class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name,:limit=>200
      t.text :description
      t.integer :demand_id
      t.integer :analysis_id
      t.integer :design_id
      t.integer :bug_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :state_id
      t.integer :user_id
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
