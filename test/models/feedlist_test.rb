require 'test_helper'

class FeedlistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:chad)
    # This code is not idiomatically correct.
    @feed = Feedlist.new(feed_url: "http://feeds.feedburner.com/CssTricks?format=xml", user_id: @user.id)
  end

  test "feed should be valid" do
    assert @feed.valid?
  end

  test "user id should be present" do
    @feed.user_id = nil
    assert_not @feed.valid?
  end
  
end
