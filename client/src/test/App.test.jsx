import React from 'react'
import { render, fireEvent } from '@testing-library/react'
import '@testing-library/jest-dom'
import {rest} from 'msw'
import {setupServer} from 'msw/node'
import App from '../App'

const response = [
  {
    id: 1,
    description: 'Save Big 50% Offer'
  },
  {
    id: 2,
    description: 'FIFA 2024 Ultimate Team Offer'
  },
  {
    id: 3,
    description: 'Get a Free Kratos Skin for Fortnite'
  }
]

const server = setupServer(
  rest.get('http://localhost:3000/api/v1/offers', (req, res, ctx) => {
    return res(ctx.json(response))
  }),
)

beforeAll(() => server.listen())
afterEach(() => server.resetHandlers())
afterAll(() => server.close())

describe('App', () => {
  it('renders without errors', () => {
    const { getByText } = render(<App />)
    
    expect(getByText('Save Big 50% Offer')).toBeInTheDocument()
  })
})