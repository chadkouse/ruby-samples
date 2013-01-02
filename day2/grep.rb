class Grep
  abort("Usage: #{__FILE__} filename phrase") if ARGV.length < 2
  filename = ARGV.shift
  phrase = ARGV.shift

  File.open(filename).each_line do |line|
    puts line unless /#{phrase}/.match(line).nil?
  end
end