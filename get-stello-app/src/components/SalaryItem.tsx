import React, {useState} from 'react';
import {Employee} from "../types/Employee";
import {useDispatch} from "react-redux";
import {updateSalary} from '../redux/reducer/organisationReducer';
import './SalaryItem.css';

export interface ItemProps {
    employee: Employee;
}

const SalaryItem: React.FC<ItemProps> = ({employee}) => {
    const dispatch = useDispatch();
    const [edit, setEdit] = useState(false);
    const [salary, setSalary] = useState(employee.salary);
    const saveSalary = () => {
        setEdit(false);
        dispatch(updateSalary({employeeName: employee.name, newSalary: salary}));
    }

    return (
        <tr key={employee.name}>
            <td style={{fontWeight: 'bold'}}>
                {employee.name}
            </td>
            {!edit ?
                <td>{employee.salary}</td> :
                <td>
                    <input
                        className="input"
                        type="text"
                        value={salary}
                        onChange={(e) => setSalary(Number(e.target.value))}
                    />
                </td>}
            <td>
                {!edit ?
                    <button className="button" onClick={() => setEdit(true)}>
                        Edit
                    </button> :
                    <button className="button" onClick={saveSalary}>
                        Save
                    </button>}
            </td>
        </tr>
    );
};

export default SalaryItem;
