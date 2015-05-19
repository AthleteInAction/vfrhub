class AddFlaggedToChimes < ActiveRecord::Migration
  def change

  	add_column :chimes,:flagged,:integer,default: 0

  end
end