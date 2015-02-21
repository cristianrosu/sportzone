json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :description, :city, :address, :latitude, :longitude, :phone, :email, :url_website, :url_facebook, :other_info, :contributor_id, :status
  json.url venue_url(venue, format: :json)
end
