# frozen_string_literal: true

require 'test_helper'

class CollaboratesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get collaborates_index_url
    assert_response :success
  end
end
