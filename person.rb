class Person
    attr_reader :id, :name, :age
    def initialize(age, name: "unknown", parent_permission:true)
        @id = 0
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def name=(new_name) 
        @name = new_name
    end

    def age=(new_age) 
        @age = new_age
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

