class Experience < ApplicationRecord
  belongs_to :user
  has_many :searches
end
