require "test_helper"

class ArtistInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get artist_info_display_url
    assert_response :success
  end
end
