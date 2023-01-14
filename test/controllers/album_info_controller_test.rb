require "test_helper"

class AlbumInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get album_info_display_url
    assert_response :success
  end
end
