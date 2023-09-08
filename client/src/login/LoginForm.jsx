import { useContext, useRef, useState } from 'react'
import { AppContext } from '../AppContext'
import './LoginForm.scss'
import { login } from '../Api'
import { Logo } from '../shared/Nav'

const LoginForm = () => {
  const email = useRef()
  const password = useRef()
  const { setCurrentUser } = useContext(AppContext)
  const [errors, setErrors] = useState({ email: '', password: '' })
  const EMAIL_REGEX = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/

  const validate = (ref) => {
    if (ref.current.type == 'email') {
      const validEmail = EMAIL_REGEX.test(String(ref.current.value).toLowerCase())
      const message = validEmail ? '' : 'Please enter a valid email address'
      setErrors({...errors, email: message})
    }
  }

  const onSubmit = (e) => {
    setErrors({...errors, form: null})
    e.preventDefault()

    const user = login(email.current.value, password.current.value)
    if (user) {
      setCurrentUser(user)
    } else {
      email.current.value = ''
      password.current.value = ''
      setErrors({...errors, form: "Invalid login"})
      setInterval(() => { setErrors({...errors, form: null}) }, 1500);
    }

  }

  return(
    <div className="login">
      <Logo />
      <form method='post' className='form' onSubmit={onSubmit}>
        { errors.form &&
          <div className="alert">{errors.form}</div>
        }
        <div className={`form-field ${ errors.email != '' ? 'error' : null }`}>
          <label htmlFor='email'>Email</label>
          <input
            id='email'
            type='email'
            name='email'
            ref={email}
            onBlur={validate.bind(this, email)}
            required />
            {errors.email != '' &&
              <span className='error-message'>{errors.email}</span>
            }
        </div>
        <div className='form-field'>
          <label htmlFor='password'>Password</label>
          <input
            id='password'
            type='password'
            name='password'
            ref={password}
            required />
        </div>
        <input type='submit' value='Login' className='btn btn-primary' />
      </form>
    </div>
  )
}

export default LoginForm;