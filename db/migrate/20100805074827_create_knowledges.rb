class CreateKnowledges < ActiveRecord::Migration
  def self.up
    create_table :knowledges do |t|
      t.string :title,:limit=>200
      t.text :content
      t.text :analysis
      t.text :plan
      t.text :knowledge
      t.text :reference
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :doc_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :knowledges
  end
end
