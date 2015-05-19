class ChangeBirthdateToDate < ActiveRecord::Migration
  def change
  	change_column :users,:birthdate,:datetime
  end
end