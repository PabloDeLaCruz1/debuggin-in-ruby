
require "faker"

require "./student"
require "./classroom"
require "./grade"
require "pry"

# Our four classrooms for the first years
A = Classroom.new("1A")
B = Classroom.new("1B")
C = Classroom.new("1C")
D = Classroom.new("1D")

def gen_student
  s = Student.new(Faker::Name.name, rand(11..20))
  s.reportcard.add_grade(Grade.new("math", rand(0..100)))
  s.reportcard.add_grade(Grade.new("history", rand(0..100)))
  s.reportcard.add_grade(Grade.new("english", rand(0..100)))
  s.reportcard.add_grade(Grade.new("science", rand(0..100)))
  return s
end

# Generate our students
(1..25).each do |i|
  A.add_student(gen_student())
end
(1..25).each do |i|
  B.add_student(gen_student())
end
(1..25).each do |i|
  C.add_student(gen_student())
end
(1..25).each do |i|
  D.add_student(gen_student())
end

# Check the rosters
# puts A.roster

# puts B.roster

# puts C.roster

# puts D.roster

############################################################
# CHALLENGE 1

def find_failing(classroom)
  classroom.students.each do |key, value|
    total = 0
    value.reportcard.grades.each do |k, v|
      total = total + k.score
    end
    if total < 200
      puts key.name + " with a score of :" + total.to_s + " you FAIL!!!"
    end
  end
end

find_failing(A)

###########################################################
# CHALLENGE 2
def find_exceptional(classroom)
  classroom.students.each do |key, value|
    total = 0
    value.reportcard.grades.map do |k, v|
      total = total + v.score
    end
    if total > 260
      puts "You are expectional " + key.name
    end
  end
end

find_exceptional B
