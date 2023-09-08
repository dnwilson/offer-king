import { useState } from 'react'
import { AppContext } from './AppContext'
import { Routes, Route } from 'react-router-dom'
import { OfferList } from './offers/Offers'
import { Nav } from './shared/Nav'
import LoginForm from './login/LoginForm'
import './App.scss'

const App = () => {
  const [currentUser, setCurrentUser] = useState()

  if (!currentUser) {
    return (
      <main className="auth">
        <LoginForm />
      </main>
    )
  }

  return (
    <main className='main'>
      <div className="container">
        <Nav />
        <AppContext.Provider value= {{ currentUser, setCurrentUser }}>
          <Routes>
            <Route path='/' element={<OfferList />} />
          </Routes>
        </AppContext.Provider>
      </div>
    </main>
  )
}

export default App
