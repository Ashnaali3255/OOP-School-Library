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

  def list_rentals_for_person
    puts "Enter the person's ID to list their rentals:"
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person not found with ID: #{person_id}"
      return
    end

    puts "Rentals for #{person.name} (ID: #{person.id}):"
    rentals = @rentals.select { |rental| rental.person.id == person.id }
    rentals.each { |rental| puts "#{rental.book.title} by #{rental.book.author} (Rental Date: #{rental.date})" }
    puts ''
  end

  def quit_app
    puts "Exiting, thanks for using this app!\n\n"
  end

  def run
    puts 'Welcome to the Console App!'
    loop do
      show_menu
      choice = read_choice
      handle_choice(choice)
      break if choice == 7
    end
  end

  private

  def show_menu
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
  end

  def handle_choice(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 6
      list_rentals_for_person
    when 7
      quit_app
    else
      create_item(choice)
    end
  end

  def create_item(choice)
    case choice
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    else
      handle_invalid_choice
    end
  end

  def handle_invalid_choice
    puts 'Invalid choice. Please try again.'
  end

  def read_choice
    gets.chomp.to_i
  end
end
