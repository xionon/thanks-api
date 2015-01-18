class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token, unique: true

      t.timestamps null: false
    end
  end
end
