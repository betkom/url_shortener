class CreatePaths < ActiveRecord::Migration[6.0]
  def change
    create_table :paths do |t|
      t.integer :url_id
      t.string :unique_code
      t.boolean :custom, default: false
      t.integer :clicks
      t.jsonb :stats, default: {}

      t.timestamps
    end
  end
end
