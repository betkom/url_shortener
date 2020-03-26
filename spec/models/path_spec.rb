require 'rails_helper'

RSpec.describe Path, type: :model do
  it { should belong_to(:base_url) }

  it { should validate_uniqueness_of(:unique_code) }
end
