class FbController < ApplicationController
  require "net/http"
  def test

  end
  
  def check
    
   
    uri = URI("https://graph.facebook.com/me?access_token=#{request.cookies['fb_auth']}")
  
  
    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri.request_uri
     @response = http.request request
     
     parsed = ActiveSupport::JSON.decode(@response.body)
     @email = parsed['email']
    end
#    http.use_ssl = true
#    response = http.request(Net::HTTP::Get.new("https://graph.facebook.com/me?access_token=#{request.cookies['fbsr_150940420812']}"))
    @cookie = request.cookies["fb_auth"]
    
  end
  
end
