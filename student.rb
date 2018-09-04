require "./reportcard"

class Student
  attr_accessor :reportcard, :name, :age

  def initialize(name, age)
    @name = name
    @age = age
    @reportcard = Reportcard.new
  end
end
