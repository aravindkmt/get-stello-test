import React, {useEffect, useState} from 'react';
import SalaryTable from "../components/SalaryTable";
import {Organisation} from "../types/Organisation";
import {useSelector} from 'react-redux';
import data from '../data.json';
import OrganisationTree from "../components/OrganisationTree";
import {Employee} from "../types/Employee";
import {useDispatch} from 'react-redux';
import {setOrganisation, selectEmployee} from '../redux/reducer/organisationReducer';
import {RootState} from "../redux/store";
import Dashboard from "../components/Dashboard";
import './LandingPage.css';

const BUDGET = 5000000
const LandingPage = () => {
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(setOrganisation(data));
        dispatch(selectEmployee(data.ceo))
    }, [dispatch]);

    return (<div className='pageLayout'>
            <div className='treeChart'>
                <OrganisationTree />
            </div>
            <div className='rightStack'>
                <div className='dashboard'>
                    <Dashboard budget={BUDGET}/>
                </div>
                <div className='salary'>
                    <SalaryTable />
                </div>
            </div>
        </div>
    );
};

export default LandingPage;
