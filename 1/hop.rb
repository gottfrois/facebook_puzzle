def start
  return nil if ARGV[0].nil? or ARGV[0].empty?
  file = File.new("./#{ARGV[0]}").readlines
  return nil if file.nil? or file[0].nil?
  n = file[0].chomp.strip.to_i
  (1..n).each {|i|

    if i % 3 == 0 and i % 5 == 0
      puts "Hop"
      next
    end
    puts "Hoppity" if i % 3 == 0
    puts "Hophop" if i % 5 == 0
  }
end

start
