require_relative 'person'

class Student < Person
  def initialize(age, classroom:, name: 'unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
