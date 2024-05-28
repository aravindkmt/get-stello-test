# frozen_string_literal: true

module Department
  DEPARTMENTS = {
    engineering: { name: "Engineering" },
    sales: { name: "Sales" },
    marketing: { name: "Marketing" },
    hr: { name: "HR" }
  }

  def self.get_department(department_symbol)
    DEPARTMENTS[department_symbol]
  end
end
