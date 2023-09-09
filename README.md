# OfferKing

A Rails Application with a React Backend that matches User with Offers based on their age and gender.

## Features

- [ ] As a User, I should be able to register
- [x] As a User, I should be able to login
- [x] As a User, I should be able to logout
- [x] As a User, I should be able to see a list of available offers
- [x] As a User, I should be able to claim an offer

### Setup

```
bundle exec rails db:setup
bin/rails dev
```

### Testing

```
# Rails tests
rspec spec

# React tests
cd client && yarn test
```

### App

[Demo](https://orca-app-itdnc.ondigitalocean.app)

### Demo Users

```
Email              | Password
------------------ | ------------
bob@example.com    | passwerk
valrie@example.com | passwerk
laurel@example.com | passwerk
daniel@example.com | passwerk
lloyd@example.com  | passwerk
```
