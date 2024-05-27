class Employee

  attr_reader :name, :role, :reportees, :manager, :salary
  attr_writer :manager
  def initialize(name, role, manager, salary, org = nil)
    @name = name
    @role = role
    @salary = salary
    set_manager(manager)
    @reportees = []
    org.add_employee(self) if org
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

  def get_authority_level
    Role.authority_level(@role)
  end

  def self.find_common_manager(employee1, employee2)

  end

end

