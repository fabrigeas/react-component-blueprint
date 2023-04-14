import React from 'react';
import './Temp.css';

export interface TempProps {}

export const testId = 'Temp';

const Temp = ({}: TempProps) => {
  return <div data-testid={testId} className="Temp"></div>;
};

export default Temp;
