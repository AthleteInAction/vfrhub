class AddFloatingToUsers < ActiveRecord::Migration
  def change

  	add_column :users,:floating,:boolean,default: false

  end
end