require 'test_helper'

class WebsitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @website = websites(:one)
  end

  test "should get index" do
    get websites_url, as: :json
    assert_response :success
  end

  test "should create website" do
    assert_difference('Website.count') do
      post websites_url, params: { website: { description: @website.description, latitude: @website.latitude, longitude: @website.longitude, published_at: @website.published_at, stars: @website.stars, subject_id: @website.subject_id, title: @website.title } }, as: :json
    end

    assert_response 201
  end

  test "should show website" do
    get website_url(@website), as: :json
    assert_response :success
  end

  test "should update website" do
    patch website_url(@website), params: { website: { description: @website.description, latitude: @website.latitude, longitude: @website.longitude, published_at: @website.published_at, stars: @website.stars, subject_id: @website.subject_id, title: @website.title } }, as: :json
    assert_response 200
  end

  test "should destroy website" do
    assert_difference('Website.count', -1) do
      delete website_url(@website), as: :json
    end

    assert_response 204
  end
end
