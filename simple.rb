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

  connection.print headers.join("\n")
  connection.close

  puts "waiting for connection..."
end
