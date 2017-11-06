require 'test_helper'

class UserStoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_story = user_stories(:one)
  end

  test "should get index" do
    get user_stories_url
    assert_response :success
  end

  test "should get new" do
    get new_user_story_url
    assert_response :success
  end

  test "should create user_story" do
    assert_difference('UserStory.count') do
      post user_stories_url, params: { user_story: { as_a: @user_story.as_a, commission_id: @user_story.commission_id, isbat: @user_story.isbat, so_that: @user_story.so_that } }
    end

    assert_redirected_to user_story_url(UserStory.last)
  end

  test "should show user_story" do
    get user_story_url(@user_story)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_story_url(@user_story)
    assert_response :success
  end

  test "should update user_story" do
    patch user_story_url(@user_story), params: { user_story: { as_a: @user_story.as_a, commission_id: @user_story.commission_id, isbat: @user_story.isbat, so_that: @user_story.so_that } }
    assert_redirected_to user_story_url(@user_story)
  end

  test "should destroy user_story" do
    assert_difference('UserStory.count', -1) do
      delete user_story_url(@user_story)
    end

    assert_redirected_to user_stories_url
  end
end
