# put all of the students in an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  # Create an empty array to store the student information
  students = [ ]
  # get the first name from the user
  name = gets.chomp
  # while the name array isn't empty, repeat
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_by_letter(students)
  puts "Please enter a letter that you would like to search by"
  input = gets.chomp.upcase
  
  puts "These are the students with names beginning with #{input}:"
  students.each do |student|
    if student[:name].start_with?(input)
      puts "#{student[:name]}"
    end
  end
  
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# We need to call the methods with any required arguements
# Methods don't have access to local variables that are defined outside of them

students = input_students
print_header
print(students)
print_footer(students)
# Exercise 8.2 print by letter
print_by_letter(students)