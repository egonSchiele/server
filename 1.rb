require 'socket'

server = TCPServer.new('127.0.0.1', 8080)

puts "waiting for connection..."
while connection = server.accept
  headers = []

  while line = connection.gets
    headers << line
    puts line

    break if line == "\r\n"
  end

  response = "hello world"

  connection.print %{
HTTP/1.0 200 OK
Content-Type: text/plain
Content-Length: #{response.size}
Expires: Thu, 01 Dec 1997 16:00:00 GMT
Last-Modified: Wed, 1 May 1996 12:45:26 GMT
Server: Apache 0.84
My-Name: Adit
Foo: Bar

#{response}
  }
  connection.close

  puts "waiting for connection..."
end
