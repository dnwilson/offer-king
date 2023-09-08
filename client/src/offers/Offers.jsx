import { useContext, useState } from 'react'
import { get } from '../Api'
import { useEffect } from 'react'
import './Offers.scss'
import { AppContext } from '../AppContext'

const Offer = ({ offer }) => {
  return (
    <div className='offer' id={`offer-${offer.id}`}>
      <img src={offer.image} className='offer-img' />
      <div className='offer-body'>
        <h2 className='offer-desc'>{offer.description}</h2>
      </div>
    </div>
  )
}

const OfferList = () => {
  const [offers, setOffers] = useState([])
  const { clearSession } = useContext(AppContext)

  useEffect(() => {
    if (offers.length == 0) {
      fetchOffers()
    }
  }, [setOffers])

  const fetchOffers = () => {
    get('offers')
      .then(response => response.data)
      .then(data => {
        setOffers(data)
      })
      .catch((error) => {
        console.error(error)
        if (error?.response?.status == 401) {
          clearSession()
        }
      })
  }

  return(
    <div className='offers'>
      { offers?.length > 0
        ? offers.map(offer => <Offer key={offer.id} offer={offer} />)
        : <>No available offers</>
      }
    </div>
  )
}

export { OfferList }