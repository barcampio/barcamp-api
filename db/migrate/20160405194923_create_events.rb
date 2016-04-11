class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, id: :uuid do |t|
      t.json :payload
      t.datetime :start_at, index: true
      t.datetime :end_at, index: true
      t.integer :facebook_id, limit: 8, index: true

      t.timestamps
    end
  end
end
