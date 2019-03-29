# Open file and print each line
File.open("quine.rb","r") { |file|
  file.readlines.each do |line|
  puts line
  end
}