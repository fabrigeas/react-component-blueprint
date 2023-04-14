import React from 'react';
import './Temp.css';

export interface TempProps {}

export const testId = 'Temp';

const Temp = ({}: TempProps) => <div data-testid={testId}></div>;

export default Temp;
