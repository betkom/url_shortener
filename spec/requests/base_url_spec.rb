require 'rails_helper'

RSpec.describe "BaseUrls API", type: :request do
  describe '#create' do
    context 'with a custom slug' do
      before { post '/url/shorten', params: {base_urls: {base_url: 'http://xyz.com', custom_slug: 'custom_slug'}} }

      it 'returns a shortened url' do
        expect(response.body).to eq('http://test.com/u/custom_slug')
      end

      it 'returns a success status' do
        expect(response.status).to eq(200)
      end
    end

    context 'without a custom slug' do
      before { post '/url/shorten', params: {base_urls: {base_url: 'http://xyz.com'}} }

      it 'returns a shortened url with a random unique code' do
        unique_code = Path.last.unique_code
        expect(response.body).to eq("http://test.com/u/#{unique_code}")
      end

      it 'returns a success status' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#show' do
    let(:url) { create(:base_url) }
    let(:path) { create(:path, base_url: url, clicks: 0) }

    context 'with a valid short link' do
      before { get "/u/#{path.unique_code}"}

      it 'redirects to the base url' do
        expect(response).to redirect_to('http://shortenertesting.com')
      end
    end

    context 'with an invalid short link' do
      before { get "/u/rylkj" }

      it 'returns an error' do
        expect(response.body).to eq('unrecognised link')
        expect(response.status).to eq(404)
      end
    end
  end

  describe '#stats' do

  end
end
