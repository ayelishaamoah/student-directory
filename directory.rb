# put all of the students in an array
students = [ 
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
puts "The students of Villains Academy"
puts "------------"

# print each item in the array
students.each do |student|
    puts student
end

# Print the total number of students 
# print() doesn't add a new line character
puts "Overall, we have #{students.count} great students"