class BaseUrlsController < ApplicationController
  ALPHANUMERICS = [*'a'..'z', *'0'..'9'].freeze

  def show
    path = Path.find_by_unique_code(params[:unique_code])

    render_json(json: 'unrecognised link', status: :not_found) and return if path.blank?

    stats = path.stats.key?(today) ? 
      path.stats.merge({"#{today}": path.stats[today] + 1}) : 
      path.stats.merge({"#{today}": 1})
    path.update(stats: stats, clicks: path.clicks + 1)
    
    redirect_to path.base_url.name
  end

  def create
    base_url = BaseUrl.find_or_create_by(name: url_params[:base_url])
    
    render_json(json: 'Something bad happened', status: 500) and return if base_url.blank?

    if url_params[:custom_slug].blank? && base_url.paths.unique.present?
      path = base_url.paths.unique
    else
      unique_code = url_params[:custom_slug] || ALPHANUMERICS.sample(6).join
      base_url.paths.create(unique_code: unique_code, clicks: 0, custom: url_params[:custom_slug].present?)
      path = Path.find_by(unique_code: unique_code)
    end
    
    render_json(json: path.short, status: :ok)
  end

  def stats
    @path = Path.find_by_unique_code(params[:unique_code])
    render_json(json: stats_json, status: :ok)
  end

  private

    def url_params
      params.require(:base_urls).permit(:custom_slug, :base_url)
    end

    def stats_json
      {
        total_visits: @path.clicks,
        created_at: @path.created_at.strftime("%Y/%m/%d") 
      }
    end

    def render_json(json:, status:)
      render json: json, status: status
    end

    def today
      DateTime.now.strftime("%Y/%m/%d")
    end
end
