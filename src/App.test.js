import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom'; // Add this import
import App from './App';

test('renders learn react text', () => {
  render(<App />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
