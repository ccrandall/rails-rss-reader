class Feedlist < ActiveRecord::Base
  belongs_to :user
  validates :feed_name, presence: true, length: { minimum: 3 }
  validates :feed_url, presence: true
end
