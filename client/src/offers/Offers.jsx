import { useState } from 'react'
import { get } from '../Api'
import { useEffect } from 'react'
import './Offers.scss'

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
      .catch((error) => console.error(error))
  }

  return(
    <div className='offers'>
      { offers
        ? offers.map(offer => <Offer key={offer.id} offer={offer} />)
        : <>No available offers</>
      }
    </div>
  )
}

export { OfferList }