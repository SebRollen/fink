class CreateFinkRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :fink_requests do |t|
      t.string :method, null: false
      t.string :url, null: false
      t.string :query
      t.string :request_body
      t.integer :status_code, null: false
      t.string :status, null: false
      t.string :response_body

      t.timestamps
    end
  end
end
