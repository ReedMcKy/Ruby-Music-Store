require "test_helper"

class SearchArtistControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get search_artist_display_url
    assert_response :success
  end
end
