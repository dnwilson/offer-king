import axios from "axios";

const http = axios.create({
  baseURL: "http://localhost:3000/api/v1",
  headers: {
    "Content-type": "application/json",
    "X-TimeZone": Intl.DateTimeFormat().resolvedOptions().timeZone
  }
})

const get = (path) => { return http.get(path) }

const login = (email, password) => {
  http
    .post('login', { email: email, password: password })
    .then(response => response.data)
    .then((data) => {
      return data
    })
    .catch((error) => {
      console.error("Error is", error)
    })
}

export { get, login };