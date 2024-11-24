class PagesController < ApplicationController
  def index
    Net::HTTP.get(URI("http://ip.jsontest.com?callback=showIP"))
    HTTParty.post("http://jsonplaceholder.typicode.com/posts", body: {
      title: "foo",
      body: "bar",
      userId: 1
    }.to_json)
    head 200
  end
end
