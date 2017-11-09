require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get landing' do
    get pages_landing_url
    assert_response :success
  end

  test 'should get contact' do
    get pages_contact_url
    assert_response :success
  end

  test 'should get faq' do
    get pages_faq_url
    assert_response :success
  end
end
