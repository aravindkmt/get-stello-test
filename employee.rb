require_relative 'role'
class Employee

  attr_reader :name, :role, :reportees, :manager, :salary, :department, :organisation
  attr_writer :manager
  def initialize(name, role, manager, salary, department, organisation = nil)
    @name = name
    @role = role
    @salary = salary
    @department = department
    set_manager(manager)
    @reportees = []
    @organisation = organisation
    organisation.add_employee(self) if organisation
  end

  def add_direct_reportees(employee)
    @reportees << employee
    employee.manager = self
  end

  def set_manager(manager)
    if @role == :ceo
      @manager = self
    elsif manager.get_authority_level > self.get_authority_level
      @manager = manager
      manager.add_direct_reportees(self)
    else
      raise "Manager authority level is less than employee"
    end
  end

  def to_h
    {
      name: @name,
      role: @role,
      salary: @salary,
      department: @department,
      reportees: @reportees.map(&:to_h),
      manager: @manager.name
    }
  end

  def get_authority_level
    Role.authority_level(@role)
  end

end

