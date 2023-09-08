import logo from '../assets/king-icon.png'
import './Nav.scss'

const Logo = ({ className }) => {
  return (
    <a href='/' className={`logo ${className ? className : ''}`}>
      <div className='logo-img'>
        <img src={logo} className='img' />
      </div>
      <span className='brand-name'>OfferKing</span>
    </a>
  )
}

const Nav = () => {
  return(
    <nav className='navbar'>
      <div className='container'>
        <div className="nav-content">
          <Logo className='brand' />
        </div>
      </div>
    </nav>
  )
}

export { Nav, Logo }