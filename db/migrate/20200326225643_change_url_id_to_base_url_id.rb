class ChangeUrlIdToBaseUrlId < ActiveRecord::Migration[6.0]
  def change
    rename_column :paths, :url_id, :base_url_id
  end
end
