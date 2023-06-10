require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teachers'

class App
  def initialize
    @books = []
    @people  []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title} Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
  end

  def person(type)
    age = prompt_input('Age').to_i
    name = prompt_input('Name')
    specialization = type.downcase == 'teacher' ? prompt_input('Specialization: ') : nil
    parent_permission = prompt_yes_no('Parent permission?')

    case type.downcase
    when 'teacher'
      @people << Teacher.new(age, specialization: specialization, name: name, parent_permission: parent_permission)
    when 'student'
      @people << Student.new(age, name: name, parent_permission: parent_permission)
    else
      puts "Invalid person type: #{type}"
      return
    end

    puts "#{type.capitalize} created successfully"
  end

  def book
    title = prompt_input('Title')
    author = prompt_input('Author')
    @books << Book.new(title: title, author: author)
    puts 'Book created successfully'
  end

  def rental
    puts 'Select a book from the following list by number'
    @books.each.with_index { |book, id| puts "#{id}) Book: #{book.title} Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select person from the following list by number (not ID)'
    @people.each.with_index do |person, id|
      puts "#{id}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_person_rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    if person
      puts 'Rentals: '
      person.rental.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.Title} Author: #{rental.book.author}"
      end
    else
      puts 'person not found!'
    end
  end

  def prompt_yes_no(message)
    val = prompt_input("#{message} (Y/N)").downcase
    %w[y yes].include?(val)
  end

  def prompt_input(message)
    puts message
    gets.chomp
  end
end

a = App.new
a.person('Teacher')
a.list_all_people
