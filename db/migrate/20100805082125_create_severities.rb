class CreateSeverities < ActiveRecord::Migration
  def self.up
    create_table :severities do |t|
      t.string :name, :limit=>200
      t.text :description
      t.integer :bug_id

      t.timestamps
    end
  end

  def self.down
    drop_table :severities
  end
end
