export class Employee {
    name: string;
    role: string;
    salary: number;
    department: string;
    reportees: Employee[];
    manager: string;

    constructor(name: string, role: string, salary: number, reportees: Employee[], manager: string, department: string) {
        this.name = name;
        this.role = role;
        this.salary = salary;
        this.reportees = reportees;
        this.manager = manager;
        this.department = department;
    }
}