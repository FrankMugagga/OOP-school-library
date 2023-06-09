require_relative 'nameable'
require_relative 'decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name: 'unknown', parent_permission: true)
    super()
    @id = 0
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if of_age? || parent_permission

    false
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  def of_age?
    return true if @age >= 18

    false
  end

  private :of_age?
end
