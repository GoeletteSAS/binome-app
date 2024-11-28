class Search < ApplicationRecord
  belongs_to :user
  belongs_to :experience, optional: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def coordinates(format: :geocoder)
    if format == :geocoder
      [latitude, longitude]
    elsif format == :mapbox
      [longitude, latitude]
    end
  end
end
