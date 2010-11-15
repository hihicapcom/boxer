class CreateFrequencies < ActiveRecord::Migration
  def self.up
    create_table :frequencies do |t|
      t.string :name, :limit=>200
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :frequencies
  end
end
