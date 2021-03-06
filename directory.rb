require 'csv'

# put all of the students in an array
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to csv file"
  puts "4. Load the list from csv file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      puts "You selected \"1. Input the students\""
      input_students
    when "2"
      puts "You selected \"2. Show the students\""
      show_students
    when "3"
      puts "You selected \"3. Save the list to csv file\""
      save_students
    when "4"
      puts "You selected \"4. Load the list from a csv file\", please enter the file that you would like to load"
      load_students
    when "9"
      puts "You selected \"9. Exit\""
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student(name, name = "november")
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def save_students
  puts "Please enter the file that you would like to save the students to"
  filename = gets.chomp
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
end

def load_students(filename = "students.csv")
  file = gets.chomp
  filename = file if !file.empty?
  CSV.foreach(filename) do |row|
    name, cohort = row[0], row[1]
      add_student(name, cohort)
  end
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first if !ARGV.first.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_student_list
  @students.each do |student|
    puts "Name: #{student[:name]}"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu