import './App.scss'
import { OfferList } from './offers/Offers'
import { Nav } from './shared/Nav'

const App = () => {
  return (
    <>
      <Nav />
      <main className='main'>
        <div className="container">
          <OfferList />
        </div>
      </main>
    </>
  )
}

export default App
