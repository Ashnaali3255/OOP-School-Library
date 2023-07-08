class Nameable
  attr_accessor :name

  def initialize(name = 'Unknown')
    @name = name
  end
end

class Person < Nameable
  attr_accessor :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(name)
    @id = Random.rand(1..1000)
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
