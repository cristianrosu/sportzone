class CreateSportsVenuesJoinTable < ActiveRecord::Migration
  def change
    create_table :sports_venues do |t|
      t.integer :sport_id
      t.integer :venue_id
    end
    add_index :sports_venues, [:sport_id, :venue_id]
  end
end
