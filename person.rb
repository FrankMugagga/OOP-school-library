require_relative 'nameable'
require_relative 'decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'unknown', parent_permission: true)
    super()
    @id = 0
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if of_age? || parent_permission

    false
  end

  def of_age?
    return true if @age >= 18

    false
  end

  private :of_age?
end
