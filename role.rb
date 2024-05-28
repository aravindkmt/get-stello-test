module Role
  ROLES = {
    ceo: { name: "CEO", authority_level: 10000 },
    cto: { name: "CTO", authority_level: 9000 },
    coo: { name: "COO", authority_level: 9000 },
    vp: { name: "VP", authority_level: 8000 },
    director: { name: "Director", authority_level: 7000 },
    manager: { name: "Manager", authority_level: 6000 },
    engineer: { name: "Engineer", authority_level: 5000 },
    employee: { name: "Employee", authority_level: 4000 }
  }

  def self.get_role(role_symbol)
    ROLES[role_symbol]
  end

  def self.add_role(role_symbol, name, authority_level)
    if ROLES.key?(role_symbol)
      raise "Role already exists"
    end
    ROLES[role_symbol] = { name: name, authority_level: authority_level }
  end

  def self.authority_level(role_symbol)
    ROLES[role_symbol][:authority_level]
  end

end