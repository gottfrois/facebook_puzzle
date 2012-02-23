load "inc/levenshtein.rb"
include Levenshtein

def loadDictionary
  f = Hash.new(1)
  File.new('/tmp/twl06.txt').readlines.each {|l| f[l.downcase.chomp] += 1}
  return f
end

def try words
  return nil if words.nil?
  r = words.find_all {|w|
    D.has_key?(w)
  }
  return r.empty? ? nil : r
end

def keepLowestDistance words
  return nil if words.nil?
  tab = Hash.new(1234567890)
  D.keys.each {|w|
    words.each {|idx|
      tmp = Levenshtein.levenshtein(w, idx)
      tab[idx] = tmp if tmp < tab[idx]
    }
  }
  return tab
end

def start
  return nil if D.nil?
  return nil if ARGV[0].nil? or ARGV[0].empty?
  f = File.new("./#{ARGV[0]}").read.scan(/\w+/)
  t = keepLowestDistance(f)
  sum = 0
  t.values.each {|i|
    sum += i
  }
  puts sum
end

D = loadDictionary
LETTERS = 'abcdefghijklmnopqrstuvwxyz'

start
