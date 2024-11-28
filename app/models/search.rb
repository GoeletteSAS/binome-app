class Search < ApplicationRecord
  belongs_to :user
  belongs_to :experience, optional: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
