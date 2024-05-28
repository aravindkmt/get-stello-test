import React from 'react';
import {Employee} from "../types/Employee";
import SalaryItem from "./SalaryItem";
import {useSelector} from "react-redux";
import {RootState} from "../redux/store";
import './SalaryTable.css';

const SalaryTable = () => {
    const organisation = useSelector((state: RootState) => state.organisation.organisation);
    const manager = useSelector((state: RootState) => state.organisation.selectedEmployee);
    const getReportees = () => {
        let reportees: Employee[] = [];
        if (!manager) {
            return reportees;
        }
        reportees = organisation?.employees.filter(employee => (manager.reportees.map(_ => _.name)).includes(employee.name)) || []
        return reportees;
    }
    return (
        <div>
            <h2>Reportees</h2>
            <div style={{paddingBottom: '10px'}}>
                <span>Showing reportees for: </span> <span style={{fontWeight: 'bold'}}>{manager?.name},</span><span
                style={{fontStyle: 'italic'}}>{manager?.role}</span>
            </div>
            <table className='table'>
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Salary</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                {getReportees().map((employee) =>
                    <SalaryItem
                        key={employee.name}
                        employee={employee}
                    />)
                }
                </tbody>
            </table>
        </div>
    );
};

export default SalaryTable;
