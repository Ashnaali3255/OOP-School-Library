class Nameable
  def initialize(name)
    @name = name
  end

  def correct_name
    raise NotImplementedError, 'Subclasses must implement correct_name method'
  end
end

class Person < Nameable
  attr_reader :name

  def correct_name
    name
  end
end
