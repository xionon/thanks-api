class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :secret_key_id
      t.string :secret_access_key

      t.timestamps null: false
    end
  end
end
