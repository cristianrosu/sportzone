class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.text :description
      t.string :city, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
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
