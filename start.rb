require_relative 'employee'
require_relative 'organisation'
require_relative 'role'

class Start

  def initialize
    seed
  end

  def seed
    ceo = Employee.new('John Doe', :ceo, nil, 100000)
    @organisation = Organisation.new('Acme Inc.', ceo)

    cto = Employee.new('Jane Doe', :cto, ceo, 90000, @organisation)
    vp = Employee.new('Jim Doe', :vp, ceo, 80000, @organisation)
    director = Employee.new('Jack Doe', :director, vp, 70000, @organisation)
    manager = Employee.new('Jill Doe', :manager, director, 60000, @organisation)
    engineer1 = Employee.new('Joe Doe', :engineer, manager, 50000, @organisation)
    engineer2 = Employee.new('Jenny Doe', :engineer, manager, 50000, @organisation)
    engineer3 = Employee.new('Jerry Doe', :engineer, director, 50000, @organisation)
    consultant = Employee.new('Judy Doe', :engineer, cto, 50000, @organisation)
    consultant_ceo = Employee.new('Jasper Doe', :engineer, ceo, 50000, @organisation)
  end

  def organisation
    @organisation
  end
end
