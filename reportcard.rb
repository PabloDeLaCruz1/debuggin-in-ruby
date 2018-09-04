class Reportcard
  attr_accessor :grades

  def initialize
    @grades = {}
  end

  def add_grade(grade)
    if @grades[grade]
      raise "Sorry, you cannot add or change #{subject} because it was already entered."
    end
    @grades[grade] = grade
  end

  def print_card
    @grades.each do |subject, grade|
      puts "Subject: #{subject} - #{grade.score}"
    end
  end

  def grades
    @grades
  end
end
