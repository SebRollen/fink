require "net/http"
require "net/https"
require "resolv"

module Fink
  module Net
    module HTTP
      def request(req, body = nil, &block)
        return super unless started?

        request_info = extract_request_info(req)
        request = Fink::Request.new(request_info)
        super.tap do |rsp|
          response_info = extract_response_info(rsp)
          request.update(response_info)
        end
      end

      private

      def extract_request_info(req)
        hostname = Resolv::IPv6::Regex.match?(address) ? "[#{address}]" : address
        uri = req.uri || URI.parse("#{use_ssl? ? "https" : "http"}://#{hostname}#{req.path}")
        url = begin
          "#{uri.scheme}://#{uri.host}#{uri.path}"
        rescue
          uri.to_s
        end

        {method: req.method, url: url, query: uri.query, request_body: req.body}
      end

      def extract_response_info(rsp)
        {status_code: rsp.code, status: rsp.message, response_body: rsp.body}
      end
    end
  end
end

Fink.register_patch(:http, Fink::Net::HTTP, Net::HTTP)
