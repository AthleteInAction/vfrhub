class CreateChimes < ActiveRecord::Migration
  def change
    create_table :chimes do |t|
      
      t.string :category
      t.integer :rating
      t.date :interaction_date
      t.string :site
      t.text :body
      t.text :body_html
      t.string :body_short
      t.string :employer
      t.string :job_title
      t.string :location
      t.string :school

      t.timestamps

    end
  end
end