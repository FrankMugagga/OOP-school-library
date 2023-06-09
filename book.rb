require_relative 'rental'

class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

=begin
def add_book(title, author)
    book = Book.new(title, author)
    books << book
    puts "Added '#{title}' by #{author} to the library."
  end
=end

  def add_rental(person, date)
    Rental.new(person, self, date)
  end
end
