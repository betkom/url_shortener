class Path < ApplicationRecord
  belongs_to :base_url
  validates_uniqueness_of :unique_code
end
