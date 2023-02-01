import React from 'react';
import { render, screen } from '@testing-library/react';
import ReactDOM from 'react-dom/client';
import { act } from 'react-dom/test-utils';
import Temp from './Temp';

let container: HTMLDivElement;

beforeEach(() => {
    container = document.createElement('div');
    document.body.appendChild(container);
});

afterEach(() => {
    document.body.removeChild(container);
    container.remove();
});

it('renders', () => {
    act(() => {
        ReactDOM.createRoot(container).render(<Temp />);
    });

    expect(screen.getBytestId('Temp')).toBeInTheDocument();
});

describe.each(['lorem', 'dolor', 'ipsum'])('', (title) => {
    test(`title => ${title}`, async () => {
        act(() => {
            render(<Temp title={title} />);
        });

        expect(screen.getByText(title)).toBeInTheDocument();
    });
});
