require_relative 'app'
require_relative 'handle_choice'

def main
  app = App.new
  puts 'Welcome to the Console App!'
  proceed = true

  while proceed
    loop do
      show_menu
      choice = read_choice
      handle_choice(choice, app)
      break if choice == 7
    end
  end
end

  private

def read_choice
  gets.chomp.to_i
end
