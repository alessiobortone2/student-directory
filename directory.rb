@students =[]

def input_students
    puts "please enter the names of students"
    puts "to finish, just hit return twice"
    name = gets.chomp
    while !name.empty? do
      @students << {name: name, cohort: :november}
      puts "now we have #{@students.count} students"
      name = gets.chomp
    end
    @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  @students.each do |student|
  puts "#{student[:name]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to file"
  puts "4. Load students from file"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "Not sure what you mean, please try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
