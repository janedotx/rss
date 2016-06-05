class AddUrisToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.text :uri, :default => ''
    end
  end

  def self.down
    remove_column :articles, :uri
  end
end
