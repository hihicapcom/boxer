class CreateParticipates < ActiveRecord::Migration
  def self.up
    create_table :participates do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :participates
  end
end
