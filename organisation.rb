# frozen_string_literal: true

class Organisation
  attr_accessor :name, :employees, :ceo

  def initialize(name, ceo)
    @name = name
    @ceo = ceo
    @employees = [ceo]
    @employee_with_max_reportees = ceo
  end

  def add_employee(employee)
    if employee.role == :ceo
      raise "CEO already exists"
    end
    if @employees.include?(employee)
      raise "Employee already exists"
    end
    @employees << employee
    update_employee_with_max_reportees(employee)
  end

  def find_max_number_of_direct_reports
    @employee_with_max_reportees.reportees.length
  end

  def employee_with_max_reportees
    @employee_with_max_reportees
  end

  def find_employee_by_name(name)
    @employees.find { |employee| employee.name == name }
  end

  private
  def update_employee_with_max_reportees(employee)
    if employee.manager.reportees.length > @employee_with_max_reportees.reportees.length
      @employee_with_max_reportees = employee
    end
  end

end
