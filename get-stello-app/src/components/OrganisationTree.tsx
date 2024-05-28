import React from 'react';

import {Employee} from "../types/Employee";
import {Tree, TreeNode} from 'react-organizational-chart';
import './OrganisationTree.css';
import {selectEmployee} from "../redux/reducer/organisationReducer";
import {useDispatch, useSelector} from "react-redux";
import {RootState} from "../redux/store";

interface EmployeeNodeProps {
    node: Employee;
}

const EmployeeNode: React.FC<EmployeeNodeProps> = ({node}) => {
    const selectedEmployee = useSelector((state: RootState) => state.organisation.selectedEmployee);
    const dispatch = useDispatch();
    const handleSelectEmployee = (employee: Employee) => {
        dispatch(selectEmployee(employee));
    };

    return (
        <div className="orgNode">
            <div className={selectedEmployee?.name == node.name ? "selectedName": node.reportees.length > 0 ? "name" : "disabledName"}
                 onClick={() => handleSelectEmployee(node)}>{node.name}</div>
            <div className="role">{node.role}</div>
            <div className="department">{node.department}</div>
        </div>
    );
};

const renderTree = (node: Employee) => (
    <TreeNode label={<EmployeeNode node={node} />}>
        {node.reportees && node.reportees.map((child) => renderTree(child))}
    </TreeNode>
);

const OrganizationTree = () => {
    const organisation = useSelector((state: RootState) => state.organisation.organisation);
    if (!organisation) {
        return <div>Loading...</div>;
    }
    return (
        <Tree label={<h2>{organisation.name}</h2>}>
            {renderTree(organisation.ceo)}
        </Tree>
    );
};

export default OrganizationTree;