class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :email
      t.string :url_website
      t.string :url_facebook
      t.integer :contributor_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
