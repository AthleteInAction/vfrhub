class SignUpStuff < ActiveRecord::Migration
  def change

  	add_column :users,:name,:string
  	add_column :users,:gender,:string
  	add_column :users,:birth_month,:integer
  	add_column :users,:birth_date,:integer
  	add_column :users,:birth_year,:integer

  end
end