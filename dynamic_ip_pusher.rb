require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

options '/ipaddress' do
	response.headers["Access-Control-Allow-Origin"] = "*"
    	response.headers["Access-Control-Allow-Methods"] = "PUT"
end

put '/ipaddress' do
  ip = request.env["HTTP_X_FORWARDED_FOR"]

  if !ip or ip.empty?
    ip = request.ip
  end

  file = File.open('ipaddress.txt', 'w')
  file.write ip
  file.close

  status 200
end

get '/ipaddress' do
  file = File.open('ipaddress.txt', 'r')
  file.readline
end
