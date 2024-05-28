require_relative 'employee'
require_relative 'organisation'
require_relative 'role'
require_relative 'department'

class Start

  def initialize
    seed
  end

  def seed
    ceo = Employee.new('John Doe', :ceo, nil, 100000, :corporate)
    @organisation = Organisation.new('Acme Inc.', ceo)

    cto = Employee.new('Jane Doe', :cto, ceo, 90000, :corporate, @organisation)
    tech_director = Employee.new('Tom Doe', :director, cto, 70000, :engineering, @organisation)
    tech_manager = Employee.new('Tim Doe', :manager, tech_director, 60000, :engineering, @organisation)
    engineer1 = Employee.new('Joe Doe', :engineer, tech_manager, 50000, :engineering, @organisation)
    engineer2 = Employee.new('Jenny Doe', :engineer, tech_manager, 50000, :engineering, @organisation)

    coo = Employee.new('Jackie Doe', :coo, ceo, 90000, :corporate, @organisation)
    hr_manager = Employee.new('James Deo', :manager, coo, 60000, :hr, @organisation)
    hr_employee = Employee.new('Jerri Doe', :employee, hr_manager, 50000,:hr, @organisation)

    vp = Employee.new('Jim Doe', :vp, ceo, 80000, :sales, @organisation)
    sales_director = Employee.new('Jack Doe', :director, vp, 70000, :sales, @organisation)
    sales_manager = Employee.new('Jill Doe', :manager, sales_director, 60000, :sales, @organisation)
    sales_employee = Employee.new('Jerry Doe', :employee, sales_manager, 50000, :sales, @organisation)

  end

  def organisation
    @organisation
  end
end
