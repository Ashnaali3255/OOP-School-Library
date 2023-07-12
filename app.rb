require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
    puts ''
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "#{person.name} (ID: #{person.id})" }
    puts ''
  end

  def create_person
    puts "Enter the person's name:"
    name = gets.chomp

    puts "Enter the person's age:"
    age = gets.chomp.to_i

    puts 'Is the person a student or a teacher? (S/T)'
    role = gets.chomp.upcase

    case role
    when 'S'
      puts "Enter a person's classroom"
      classroom = gets.chomp
      create_student(age, name, classroom)
    when 'T'
      puts "Enter a person's specialization"
      specialization = gets.chomp
      create_teacher(age, name, specialization)
    else
      puts 'Invalid input. Please try again.'
    end
  end

  def create_student(age, name, classroom)
    student = Student.new(age, name, classroom)
    @people << student
    puts "Student created: #{student.name} (ID: #{student.id})"
    puts ''
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts "Teacher created: #{teacher.name} (ID: #{teacher.id})"
    puts ''
  end

  def create_book
    puts "Enter the book's title:"
    title = gets.chomp

    puts "Enter the book's author:"
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts "Book created: #{book.title} by #{book.author}"
    puts ''
  end

  def create_rental
    puts "Enter the person's ID for the rental:"
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person not found with ID: #{person_id}"
      return
    end

    puts "Enter the book's title for the rental:"
    book_title = gets.chomp

    book = @books.find { |b| b.title == book_title }
    if book.nil?
      puts "Book not found with title: #{book_title}"
      return
    end

    puts 'Enter the rental date (YYYY-MM-DD):'
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created: #{rental.book.title} by #{rental.person.name} (ID: #{rental.person.id})"
    puts ''
  end

  def list_rentals_for_person(person)
    puts "Rentals for #{person.name} (ID: #{person.id}):"
    rentals = @rentals.select { |rental| rental.person.id == person.id }
    rentals.each { |rental| puts "#{rental.book.title} by #{rental.book.author} (Rental Date: #{rental.date})" }
    puts ''
  end

  def find_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def quit_app
    puts "Exiting, thanks for using this app!\n\n"
  end
end
