import {Employee} from "./Employee";

export class Organisation {
    name: string;
    ceo: Employee;
    employees: Employee[];

    constructor(name: string, ceo: Employee, employees: Employee[]) {
        this.name = name;
        this.ceo = ceo;
        this.employees = employees;
    }
}