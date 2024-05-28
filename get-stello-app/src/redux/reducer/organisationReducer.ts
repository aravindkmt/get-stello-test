import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { Organisation } from "../../types/Organisation";
import { Employee } from "../../types/Employee";

interface OrganisationState {
    organisation: Organisation | null;
    selectedEmployee: Employee | null;
}

const initialState: OrganisationState = {
    organisation: null,
    selectedEmployee: null
};

const organisationSlice = createSlice({
    name: 'organisation',
    initialState,
    reducers: {
        setOrganisation: (state, action: PayloadAction<Organisation>) => {
            state.organisation = action.payload;
        },
        updateSalary: (state, action: PayloadAction<{ employeeName: string, newSalary: number }>) => {
            if (state.organisation) {
                const { employeeName, newSalary } = action.payload;
                const updatedEmployees = state.organisation.employees.map((employee: Employee) => {
                    if (employee.name === employeeName) {
                        return { ...employee, salary: newSalary };
                    }
                    return employee;
                });
                state.organisation.employees = updatedEmployees;
            }
        },
        selectEmployee: (state, action: PayloadAction<Employee>) => {
            state.selectedEmployee = action.payload;
        },
    },
});

export const { setOrganisation, updateSalary, selectEmployee } = organisationSlice.actions;

export default organisationSlice.reducer;