Rails.application.routes.draw do
  post '/url/shorten', to: 'base_urls#create', as: :shorten

  get '/u/:unique_code', to: 'base_urls#show', as: :short
  get '/u/:unique_code/stats', to: 'base_urls#stats', as: :stats
end
