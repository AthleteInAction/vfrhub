class AddUserIdToChime < ActiveRecord::Migration
  def change

  	add_column :chimes,:user_id,:integer

  end
end