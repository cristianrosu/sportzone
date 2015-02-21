class Venue < ActiveRecord::Base

  has_and_belongs_to_many :sports

  geocoded_by :full_address
  after_validation :geocode, :if => :full_address_changed?

  # validations

  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :sports, presence: true



  def full_address
    self.city + self.address
  end

  def full_address_changed?
    city_changed? || address_changed?
  end
end
