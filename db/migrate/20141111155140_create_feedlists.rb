class CreateFeedlists < ActiveRecord::Migration
  def change
    create_table :feedlists do |t|
      t.text :feed_url
      t.references :user, index: true

      t.timestamps
    end
    add_index :feedlists, [:user_id, :created_at]
  end
end
