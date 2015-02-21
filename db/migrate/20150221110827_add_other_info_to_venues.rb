class AddOtherInfoToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :other_info, :hstore
  end
end
