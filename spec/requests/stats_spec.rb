require 'rails_helper'

RSpec.describe "Stats API", type: :request do
  describe '#index' do
    let(:url) { create(:base_url) }

    before {
      create(:path, base_url: url, unique_code: 'sveru6', clicks: 4, stats: {})
      get '/stats'
    }

    it 'returns the stats' do
      api_response = JSON.parse(response.body)
      expect(api_response['total_visits']["#{url.name}"]).to eql(4)
    end
  end
end