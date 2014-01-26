#!/home/r3v3147i0n/.rvm/rubies/ruby-2.0.0-p247/bin/ruby

path = File.expand_path('../config/application.yml', __FILE__)
puts path

File.readlines(path).each do |line| 
  key_and_val = line.scan(/(\w+)/)
  key = key_and_val[0][0]
  val = key_and_val[1][0]
  puts "#{key}=#{val}"
  %x{heroku config:set #{key}=#{val}} 
end

