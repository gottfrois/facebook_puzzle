def start
  return nil if ARGV[0].nil? or ARGV[0].empty?
  res = Array.new
  File.new("./#{ARGV[0]}").read.each {|l|
    try = /^[a-zA-Z]+[ ]+([0-9]+)$/.match(l)
    res << try[1].to_i if !try.nil?
  }
  puts "#{res.max} #{res.min}"
end

start
