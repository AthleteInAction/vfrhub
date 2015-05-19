class AddAuthorIdToChimes < ActiveRecord::Migration
  def change

  	add_column :chimes, :author_id, :integer

  end
end