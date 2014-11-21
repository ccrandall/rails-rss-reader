class AddFeedNameToFeedlist < ActiveRecord::Migration
  def change
    add_column :feedlists, :feed_name, :string
  end
end
