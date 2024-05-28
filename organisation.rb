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

  def find_common_manager(employee_name_1, employee_name_2)
    employee1 = find_employee_by_name(employee_name_1)
    employee2 = find_employee_by_name(employee_name_2)

    managers1 = Set.new
    ceo = self.ceo
    common_manager = ceo

    current_employee_1 = employee1
    while current_employee_1 != ceo
      managers1.add(current_employee_1)
      current_employee_1 = current_employee_1.manager
    end

    current_employee_2 = employee2
    while current_employee_2 != ceo
      if managers1.include?(current_employee_2)
        common_manager = current_employee_2
        break
      end
      current_employee_2 = current_employee_2.manager
    end

    common_manager = employee1.manager if common_manager == employee1
    common_manager = employee2.manager if common_manager == employee2

    common_manager
  end

  def to_h
    {
      'name' => @name,
      'ceo' => @ceo.to_h,
      'employees' => @employees.map(&:to_h)
    }
  end

  private
  def update_employee_with_max_reportees(employee)
    if employee.manager.reportees.length > @employee_with_max_reportees.reportees.length
      @employee_with_max_reportees = employee.manager
    end
  end

  def find_employee_by_name(name)
    @employees.find { |employee| employee.name == name }
  end

end
