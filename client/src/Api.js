import axios from "axios";

const http = axios.create({
  baseURL: "http://localhost:3000/api/v1",
  headers: {
    "Content-type": "application/json",
    "X-TimeZone": Intl.DateTimeFormat().resolvedOptions().timeZone
  }
})

const get = (path) => { return http.get(path) }
const post = (path, data) => { return http.post(path, data) }

const logout = () => {
  http
    .delete('logout')
    .then(response => {
      console.log("Response", response)
    })
    .catch((error) => {
      console.error(error)
    })
}

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

export { get, post, login, logout };