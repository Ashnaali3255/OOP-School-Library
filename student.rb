require_relative 'person'

class Student < Person 
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)  
    super(age, name, parent_permission)
  end
end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
