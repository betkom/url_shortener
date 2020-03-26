require 'rails_helper'

RSpec.describe BaseUrl, type: :model do
  it "has a valid factory" do
    expect(build(:base_url)).to be_valid
  end

  it { should have_many(:paths).dependent(:destroy) }

  it { should validate_presence_of(:name) }
end
