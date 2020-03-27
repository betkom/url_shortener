class StatsController < ApplicationController
  ### Retrieve global stats

  def index
    @paths = Path.all
    render json: stats, status: 200
  end

  private
    def stats
      {
        total_visits: total_clicks
      }
    end

    def total_clicks
      data = Hash.new
      @paths.each { |path| data["#{path.base_url.name}"] =  path.clicks}
      data
    end
end