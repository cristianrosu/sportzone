class VenuePresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  HOST = ActionMailer::Base.default_url_options[:host]

  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def api_url
    api_venue_url(self, host: HOST)
  end

  def web_url
    venue_url(self, host: HOST)
  end

  def to_builder
    Jbuilder.new do |venue|
      venue.(self, :id, :name, :description, :city,
             :address, :latitude, :longitude, :phone,
             :email, :url_website, :url_facebook,
             :other_info, :contributor_id, :status,
             :created_at, :updated_at, :api_url, :web_url)
      venue.sports do |json|
        json.array! self.sports, :id, :name
      end
    end
  end

  def to_json
    JSON.parse(to_builder.target!)
  end
end
