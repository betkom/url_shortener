class BaseUrl < ApplicationRecord
  has_many :paths, dependent: :destroy

  validates_presence_of :name
  validates :name, format: URI::regexp(%w[http https])
end
