class CreateImplements < ActiveRecord::Migration
  def self.up
    create_table :implements do |t|
      t.integer :task_id
      t.integer :user_id
      t.datetime :created_at
      t.integer :state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :implements
  end
end
