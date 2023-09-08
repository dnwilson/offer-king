# OfferKing

A Rails Application with a React Backend that matches User with Offers based on their age and gender.

## Features

- As a User, I should be able to register
- As a User, I should be able to login
- As a User, I should be able to logout
- As a User, I should be able to see a list of available offers
- As a User, I should be able to claim an offer

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
