class CreateListitems < ActiveRecord::Migration
  def up
  	create_table :list_items do |t|
  		t.string :title
  		t.string :content
  	end
  end
  def down
  	drop_table :list_items
  end
end
