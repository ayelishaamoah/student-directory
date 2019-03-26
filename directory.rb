# put all of the students in an array
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
    cohort = gets.chomp
    cohort = "Unknown" if cohort == ""
    puts "How old are they?"
    age = gets.chomp
    age = "Unknown" if age == ""
    puts "What country are they from?"
    country = gets.chomp
    country = "Unknown" if country == ""
    
    students << {name: name, cohort: cohort.to_sym, age: age, country: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
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
  puts "Overall, we have #{names.count} great students".center(60)
end

# We need to call the methods with any required arguements
# Methods don't have access to local variables that are defined outside of them

students = input_students
print_header
print(students)
print_footer(students)
=begin
# Exercise 8.2 print by letter
print_by_letter(students)
# Exercise 8.3 print names less than 12 characters
print_names_less_than_12(students)
=end