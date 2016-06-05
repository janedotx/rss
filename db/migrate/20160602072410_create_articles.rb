class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.text :headline
      t.integer :starred

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
