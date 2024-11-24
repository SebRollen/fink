module Fink
  class RequestsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @request = fink_requests(:get)
    end

    def test_index
      get requests_path
      assert_response :success
    end

    def test_show
      get request_path(@request)
      assert_response :success
    end

    def test_visiting_page_that_sends_request_generates_record
      assert_difference "Fink::Request.count" do
        get pages_path
      end
    end
  end
end
