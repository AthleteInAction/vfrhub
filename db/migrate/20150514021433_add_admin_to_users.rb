class AddAdminToUsers < ActiveRecord::Migration
  def change

  	add_column :users,:access,:integer,default: 0

  end
end