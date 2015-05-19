class AddFieldsToSocials < ActiveRecord::Migration
  def change

  	add_column :socials,:category,:string
  	add_column :socials,:profile,:string

  end
end