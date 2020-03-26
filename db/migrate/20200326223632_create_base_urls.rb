class CreateBaseUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :base_urls do |t|
      t.string :name

      t.timestamps
    end
  end
end
