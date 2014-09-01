put '/ipaddress' do
  ip = request.ip

  file = File.open('ipaddress.txt', 'w')
  file.write ip
  file.close

  status 200
end

get '/ipaddress' do
  file = File.open('ipaddress.txt', 'r')
  file.readline
end