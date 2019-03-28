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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
      puts "You selected \"3. Save the list to students.csv\""
      save_students
    when "4"
      puts "You selected \"4. Load the list from students.csv\""
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
  File.open("students.csv", "w") { |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  }
end

# We can add in a default arguement value if nothing is passed in to the method
def load_students(filename = "students.csv")
  File.open(filename, "r") { |file|
  # Read all of the lines in a file and return an array
  file.readlines.each do |line|
    # Each line with have a trailing newline character
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  }
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