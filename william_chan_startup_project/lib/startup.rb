require "employee"

class Startup
    attr_accessor :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
       @salaries.has_key?(title)
    end

    def >(second_startup)
        self.funding > second_startup.funding
    end

    def hire(employee_name, title)
       if valid_title?(title)
        @employees << Employee.new(employee_name, title)
       else
        raise "Not a valid title"
       end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if self.funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            self.funding -= @salaries[employee.title]
        else
            raise "Insufficient Startup Funds."
        end
    end

    def payday
        @employees.each {|ele| pay_employee(ele)}
    end

    def average_salary
        sum = 0
        @employees.each do |ele|
            sum += @salaries[ele.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        self.funding += startup.funding
        startup.salaries.each do |k, v|
            if self.salaries.has_key?(k)
                self.salaries[k] = self.salaries[k]
            else
                self.salaries[k] = v
            end
        end
        self.employees.concat(startup.employees)
        startup.close
    end
end
