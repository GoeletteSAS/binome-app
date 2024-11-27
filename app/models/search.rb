class Search < ApplicationRecord
  belongs_to :user
  belongs_to :experience, optional: true
end
