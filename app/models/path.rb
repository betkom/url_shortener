class Path < ApplicationRecord
  belongs_to :base_url
  validates_uniqueness_of :unique_code

  scope :unique, -> { where(custom: false).first }

  def short
    Rails.application.routes.url_helpers.short_url(unique_code: self.unique_code)
  end
end
