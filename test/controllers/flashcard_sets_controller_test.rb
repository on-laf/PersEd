require 'test_helper'

class FlashcardSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flashcard_sets_index_url
    assert_response :success
  end

  test "should get new" do
    get flashcard_sets_new_url
    assert_response :success
  end

  test "should get create" do
    get flashcard_sets_create_url
    assert_response :success
  end

  test "should get show" do
    get flashcard_sets_show_url
    assert_response :success
  end

  test "should get edit" do
    get flashcard_sets_edit_url
    assert_response :success
  end

  test "should get update" do
    get flashcard_sets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get flashcard_sets_destroy_url
    assert_response :success
  end

end
