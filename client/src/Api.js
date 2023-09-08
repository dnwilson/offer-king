import axios from 'axios';
import { useSession } from './hooks/useSession';

const http = axios.create({
  baseURL: 'http://localhost:3000/api/v1',
  headers: {
    'Content-type': 'application/json',
    'X-TimeZone': Intl.DateTimeFormat().resolvedOptions().timeZone
  }
})

http.interceptors.request.use((config) => {
  const token = JSON.parse(localStorage.getItem('token'))
  config.headers.Authorization = `Bearer ${token}`
  return config
})

const get = (path) => { return http.get(path) }
const post = (path, data) => { return http.post(path, data) }
const destroy = (path) => { return http.delete(path) }

export { get, post, destroy };