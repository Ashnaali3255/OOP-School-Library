def handle_choice(choice, app)
  case choice
  when 1
    list_books(app)
  when 2
    list_people(app)
  when 6
    list_rentals_for_person(app)
  when 7
    quit_app
    exit
  else
    create_item(choice, app)
  end
end

 def list_books(app)
  puts 'List of Books:'
  app.list_books
  puts ''
end

 def list_people(app)
  puts 'List of People:'
  app.list_people
  puts ''
end

 def list_rentals_for_person(app)
  puts "Enter the person's ID to list their rentals:"
  person_id = gets.chomp.to_i
   person = app.find_person_by_id(person_id)
  if person.nil?
    puts "Person not found with ID: #{person_id}"
    return
  end
   app.list_rentals_for_person(person)
end
 def quit_app
  puts 'Exiting the Console App...'
end
 def create_item(choice, app)
  case choice
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  else
    handle_invalid_choice
  end
end
 def handle_invalid_choice
  puts 'Invalid choice. Please try again.'
end