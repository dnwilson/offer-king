import { useState } from 'react'
import { AppContext } from './AppContext'
import { Route, Routes } from 'react-router-dom'
import { OfferList } from './offers/Offers'
import { Nav } from './shared/Nav'
import LoginForm from './login/LoginForm'
import './App.scss'
import { useSession } from './hooks/useSession'

const App = () => {
  const { token, currentUser, setSession, clearSession } = useSession()

  console.log("Current user", currentUser?.first_name)
  console.log("Token", token)

  return (
    <AppContext.Provider value={{currentUser, token, setSession}}>
      { token
        ? (
          <>
            <Nav user={currentUser} logout={clearSession} />
            <div className="main">
              <div className="container">
                  <Routes>
                    <Route path='/' element={<OfferList />} />
                  </Routes>
              </div>
            </div>
          </>
        )
        : <LoginForm />
      }
    </AppContext.Provider>
  )
}

export default App
