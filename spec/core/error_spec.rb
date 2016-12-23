require 'spec_helper'

RSpec.describe "Error", :type => :error do
  it "confirm value initialize" do
    error = Caplinked::Error.new(401, "Unauthorized", {
                        "Cache-Control"=>"no-cache",
                        "Content-Type"=>"application/json;
                        charset=UTF-8",
                        "Date"=>"Thu, 22 Dec 2016 23:14:14 GMT",
                        "Server"=>"caplinked",
                        "Strict-Transport-Security"=>"max-age=31536000",
                        "X-Rack-Cache"=>"miss",
                        "X-Request-Id"=>"a815c789-91ff-426b-a795-7a7fa8514bd0",
                        "X-Runtime"=>"0.002944",
                        "Content-Length"=>"47",
                        "Connection"=>"Close"
                        })

    expect(error.inspect).to eq("#<Caplinked::Error: Unauthorized>")
  end
end
