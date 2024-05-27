require_relative 'start'
require_relative 'organisation'
require_relative 'employee'

class OrganisationTest
  def setup
    @ceo = Employee.new('CEO', :ceo, nil, 100000)
    @organisation = Organisation.new('Test Organisation', @ceo)
  end

  def execute
    test_add_employee
    test_find_max_number_of_direct_reports
    test_find_common_manager_returns_ceo_when_employees_are_in_different_divisions
    test_find_common_manager_returns_direct_manager_when_employees_are_in_same_division
    test_find_common_manager_returns_one_level_up_manager_when_first_employee_are_is_a_reportee_of_second
    test_find_common_manager_returns_one_level_up_manager_when_second_employee_are_is_a_reportee_of_first
  end

  def test_add_employee
    @cto = Employee.new('CTO', :cto, @ceo, 50000, @organisation)
    raise unless @organisation.employees.include?(@cto)
  end

  def test_find_max_number_of_direct_reports
    @manager = Employee.new('Manager', :manager, @cto, 50000, @organisation)
    @employee1 = Employee.new('Employee 1', :engineer, @manager, 40000, @organisation)
    @employee2 = Employee.new('Employee 2', :engineer, @manager, 40000, @organisation)
    @employee3 = Employee.new('Employee 3', :engineer, @manager, 40000, @organisation)
    raise unless @organisation.find_max_number_of_direct_reports == 3
    raise unless @organisation.employee_with_max_reportees == @manager
  end

  def test_find_common_manager_returns_ceo_when_employees_are_in_different_divisions
    @vp = Employee.new('VP', :vp, @ceo, 50000, @organisation)
    raise unless @organisation.find_common_manager('VP', 'Employee 2') == @ceo
  end

  def test_find_common_manager_returns_direct_manager_when_employees_are_in_same_division
    raise unless @organisation.find_common_manager('Employee 1', 'Employee 2') == @manager
  end

  def test_find_common_manager_returns_one_level_up_manager_when_first_employee_are_is_a_reportee_of_second
    raise unless @organisation.find_common_manager('Employee 1', 'Manager') == @cto
  end

  def test_find_common_manager_returns_one_level_up_manager_when_second_employee_are_is_a_reportee_of_first
    raise unless @organisation.find_common_manager('Manager', 'Employee 2') == @cto
  end

  def test_find_common_manager_returns_ceo_when_one_employee_are_is_ceo
    raise unless @organisation.find_common_manager('CEO', 'Employee 2') == @ceo
  end

  def organisation
    @organisation
  end

end