class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :recipient
      t.string :body
      t.references :api_key, index: true

      t.timestamps null: false
    end
    add_foreign_key :messages, :api_keys
  end
end
