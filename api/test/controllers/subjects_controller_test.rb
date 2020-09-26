require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
  end

  test "should get index" do
    get subjects_url, as: :json
    assert_response :success
  end

  test "should create subject" do
    assert_difference('Subject.count') do
      post subjects_url, params: { subject: { name: @subject.name } }, as: :json
    end

    assert_response 201
  end

  test "should show subject" do
    get subject_url(@subject), as: :json
    assert_response :success
  end

  test "should update subject" do
    patch subject_url(@subject), params: { subject: { name: @subject.name } }, as: :json
    assert_response 200
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject), as: :json
    end

    assert_response 204
  end
end
