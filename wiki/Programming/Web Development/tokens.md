---
title: Authentication
description: Authentication in web development is the way to verify that a given user is who they say they are.
---

## How It Works

To authenticate that a user and their client are who they say they are, a few steps need to occur:

1. User sends credentials (e.g. username and password) to server
2. Server verifies these credentials are accurate by checking their data store, usually via a test of the password's hash in their database[3]
3. Server returns to the client whether or not these credentials are accurate

This is easy enough, but becomes unwieldy if the application needs you to verify your identity for various actions, as it will have to repeat these three steps for every request, which is very costly.

### Token

One solution is to use a token protocol like JWT[4], which stores three elements within it:

1. Header - Identifies which algorithm is used to generate the signature
2. Payload - Contains data to be used for verification (e.g. username)
3. Signature - Securely validates the token

This token takes a JSON structure and puts it into a string via base64 encoding. So now instead of having to send the username and password and check with the database every single request, we can verify that the token is accurate and contains the necessary information for the user to act (e.g. their username). The steps that occur now are a little different:

1. User sends credentials (e.g. username and password) to server
2. Server verifies these credentials are accurate by checking their data store, usually via a test of the password's hash in their database
3. If accurate, server creates a JWT that proves this user is who they say they are
4. Server returns the JWT to the client

For all further interactions:

1. User sends JWT
2. Server verifies JWT is valid
3. Server performs requested action

This is much simpler and less costly, as we only talk to the database one time. We don't need the password for every interaction since we verified it once that it is accurate and created a token that proves that on the server side.

## References

1. https://kevin.burke.dev/kevin/things-to-use-instead-of-jwt/
2. https://frontegg.com/blog/token-based-authentication
3. https://auth0.com/blog/hashing-passwords-one-way-road-to-security/
4. https://jwt.io/
5. https://en.wikipedia.org/wiki/JSON_Web_Token