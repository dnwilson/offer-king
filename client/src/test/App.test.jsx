import React from 'react'
import { render, fireEvent } from '@testing-library/react'
import '@testing-library/jest-dom'
import App from '../App'

describe('App', () => {
  it('renders without errors', () => {
    const { getByText } = render(<App />)
    
    expect(getByText('Vite + React')).toBeInTheDocument()
    expect(getByText('count is 0')).toBeInTheDocument()
  })

  it('handles counter click', () => {
    const { getByText } = render(<App />)
    const counterBtn = getByText('count is 0')

    fireEvent.click(counterBtn)

    expect(counterBtn).toHaveTextContent("count is 1")
  })
})