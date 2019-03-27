# put all of the students in an array
def interactive_menu
  students = []
  # Loop indefinitely - until the program terminates
  loop do
  # 1. print the menu and ask the user what to do
    print_menu
    selection = gets.chomp
  # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)  
      when "9"
        exit
      else
        puts "I don't know what you mean, try again"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  # Create an empty array to store the student information
  students = []
  # get the first name from the user
  name = gets.chomp
  # while the name variable isn't empty, repeat
  while !name.empty? do
    # get student information from the user and set any default values if question skipped
    puts "Which cohort will they be joining?"
    cohort = gets.gsub(/\n/,"")
    cohort = "Unknown" if cohort == ""
    puts "How old are they?"
    age = gets.gsub(/\n/,"")
    age = "Unknown" if age == ""
    puts "What country are they from?"
    country = gets.gsub(/\n/,"")
    country = "Unknown" if country == ""
    
    students << {name: name, cohort: cohort.to_sym, age: age, country: country}
    
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.gsub(/\n/,"")
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(60)
  puts "------------".center(60)
end

def print(students)
  cohorts = students.map { |student| student[:cohort] }.uniq
    cohorts.each do |cohort|
      puts "#{cohort} Cohort:"
      students.each do |student|
        if student[:cohort] == cohort
          puts "Name: #{student[:name]}, Age:#{student[:age]}, Country: #{student[:country]}"
        end
      end
  end
end

def print_by_letter(students)
  puts
  puts "Please enter a letter that you would like to search by"
  input = gets.chomp.upcase
  
  puts "These are the students with names beginning with #{input}:"
  students.each do |student|
    if student[:name].start_with?(input)
      puts "#{student[:name]}"
    end
  end
end

def print_names_less_than_12(students)
  puts "These are the students with names that are less than 12 characters long:"
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]}"
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(60)
  else
    puts "Overall, we have #{names.count} great students".center(60)
  end
end

interactive_menu