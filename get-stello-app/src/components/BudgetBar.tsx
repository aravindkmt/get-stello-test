import React from 'react';
import './BudgetBar.css';

interface BudgetBarProps {
    name: string;
    total: number;
    used: number;
}

const BudgetBar: React.FC<BudgetBarProps> = ({name, total, used}) => {
    const percentage = Math.round((used / total) * 100);


    return (<div className='budgetBar'>
            <div>{name}</div>
            <div style={{display: 'inherit'}}>
                <div style={{position: 'relative', width: '400px'}}>
                    <progress value={used} max={total} style={{width: '100%'}}></progress>
                </div>
                <div style={{width: '50px', textAlign: 'right'}}>{percentage}%</div>
            </div>
        </div>
    );
};

export default BudgetBar;