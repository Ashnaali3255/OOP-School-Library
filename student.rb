require_relative 'person'
class Student < Person
  attr_reader :classroom

  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
    # classroom&.add_student(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
