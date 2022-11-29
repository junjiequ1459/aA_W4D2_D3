require_relative 'employee'

class Manager < Employee
    attr_accessor :sub_employees, :name

    def initialize(name, title, salary, boss)
        super
        @sub_employees = []
        
    end

    def add_sub(employee)
        @sub_employees << employee.salary if employee.boss == name 
    end

    def bonus(multiplier)
        total = 0
        @sub_employees.each do |ele|
            total += ele 
        end
        bonus = total * multiplier
    end
end

emp1 = Employee.new('David', 'TA', 10000, 'Darren')
emp2 = Employee.new('Shawna', 'TA', 12000, 'Darren')
man1= Manager.new('Darren', 'Manager', 78000, 'Ned')

man1.add_sub(emp1)
man1.add_sub(emp2)

p emp1.bonus(2)
p emp2.bonus(2)
p man1.sub_employees

p man1.bonus(2)