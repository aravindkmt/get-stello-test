import React from 'react';
import BudgetBar from "./BudgetBar";
import {useSelector} from "react-redux";
import {RootState} from "../redux/store";
import './Dashboard.css';


interface DashboardProps {
    budget: number;
}

const Dashboard: React.FC<DashboardProps> = ({budget}) => {
    const organisation = useSelector((state: RootState) => state.organisation.organisation);
    if (!organisation) {
        return <div>Loading...</div>;
    }
    const usedTotalBudget = organisation.employees.reduce((acc, employee) => acc + employee.salary, 0);
    const usedCorporateBudget = organisation.employees.filter(employee => employee.department === 'corporate').reduce((acc, employee) => acc + employee.salary, 0);
    const usedEngineeringBudget = organisation.employees.filter(employee => employee.department === 'engineering').reduce((acc, employee) => acc + employee.salary, 0);
    const usedOperationsBudget = organisation.employees.filter(employee => employee.department === 'hr').reduce((acc, employee) => acc + employee.salary, 0);
    const usedSalesBudget = organisation.employees.filter(employee => employee.department === 'sales').reduce((acc, employee) => acc + employee.salary, 0);
    return (<>
        <div className="dashboardLayout">
            <h2>Salary Budget Dashboard</h2>
            <BudgetBar name={'Overall'} total={budget} used={usedTotalBudget}/>
            <BudgetBar name={'Corporate'} total={budget*.1} used={usedCorporateBudget}/>
            <BudgetBar name={'Engineering'} total={budget*.5} used={usedEngineeringBudget}/>
            <BudgetBar name={'Operations'} total={budget*.2} used={usedOperationsBudget}/>
            <BudgetBar name={'Sales'} total={budget*.2} used={usedSalesBudget}/>
        </div>
    </>);
};

export default Dashboard;
