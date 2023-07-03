require_relative 'person'

class Student < Person
  def initialize(id, age, classroom, parent_permission: true, name: 'Unknown')
    super(id, age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
