# Legal Services API

## User Stories

- A user is able to register as a client
- A user is able to log in as a client to an existing account
- A user is able to register as an advocate
- A user is able to log in as an advocate to an existing account
- A client is able to create a dispute with an advocate of their choice in the specific field
- A client is able to get a list of all his/her created disputes
- An advocate is able to get a list of all disputes he/she is associated with
- An advocate is able to get a list of all cliients he/she is representing
- An advocate is able to update & delete an client's dispute record

## API Documentation

### Clients

1. Sign Up - New client registration & creates a session for the user

   POST: `/api/clients/signup`

   Response:

```json
{
  "id": 5,
  "name": "Tess",
  "email": "tess@gmail.com",
  "phone": "0712345687"
}
```

2. Show - Auto-login & returns logged in client's data with all his/her disputes

   GET: `/api/clients/me`

   Response:

```json
{
  "id": 1,
  "name": "Brian",
  "email": "Brian@gmail.com",
  "phone": "123340",
  "disputes": [
    {
      "id": 1,
      "client_name": "Brian",
      "advocate_name": "Biko",
      "dispute_category_name": "Children Law",
      "dispute_description": "parental responsibility,fostering, adoption, custody, maintenance, guardianship, care and protection of children.",
      "dispute_info": "I don't play the odds, I play the man.",
      "created": "2023-01-03 09:27:24 UTC"
    },
    {
      "id": 20,
      "client_name": "Brian",
      "advocate_name": "Njomo",
      "dispute_category_name": "Family Law",
      "dispute_description": "issues involving family relationships such as marriage and divorce.",
      "dispute_info": "Sometimes good is not good enough.",
      "created": "2023-01-03 09:27:24 UTC"
    }
  ]
}
```

3. Index - Returns list of all clients (Only advocates are authorized)

   GET: `/api/clients`

   Response:

```json
[
  {
    "id": 4,
    "name": "Mike",
    "email": "mike@gmail.com",
    "phone": "0712345687"
  },
  {
    "id": 5,
    "name": "Tess",
    "email": "tess@gmail.com",
    "phone": "0712345687"
  }
]
```

4. Login - Creates a client session

   POST: `/api/clients/login`

   Response:

```json
{
  "id": 5,
  "name": "Tess",
  "email": "tess@gmail.com",
  "phone": "0712345687"
}
```

5. Logout - Deletes an active client's session

   DELETE: `/api/clients/logout`

   <hr />

### Dispute Categories

1.  Index - Returns all dispute categories with its associated advocates, disputes and their sub-types.

    GET: `/api/dispute_categories`

    Response:

```json
[
  {
    "id": 4,
    "category_name": "Succession Law",
    "category_description": "deals with how to distribute a deceased individual's property.",
    "advocates": [
      {
        "id": 4,
        "name": "Jon",
        "phone": "63797293",
        "email": "jon@gmail.com",
        "years_of_practice": 11,
        "pin_number": 297662,
        "disputes": [
          {
            "id": 4,
            "client_name": "Cynthia",
            "advocate_name": "Jon",
            "dispute_category_name": "Succession Law",
            "dispute_description": "deals with how to distribute a deceased individual's property.",
            "dispute_info": "I am sorry I don't have photographic memory, but my brain is too busy being awesome.",
            "created": "2023-01-03 09:27:24 UTC"
          }
        ]
      },
      {
        "id": 5,
        "name": "Dorcas",
        "phone": "28307429",
        "email": "dorcas@gmail.com",
        "years_of_practice": 15,
        "pin_number": 595923,
        "disputes": [
          {
            "id": 10,
            "client_name": "Rhoda",
            "advocate_name": "Dorcas",
            "dispute_category_name": "Succession Law",
            "dispute_description": "deals with how to distribute a deceased individual's property.",
            "dispute_info": "I don't have dreams, I have goals.",
            "created": "2023-01-03 09:27:24 UTC"
          }
        ]
      }
    ],
    "dispute_types": [
      {
        "id": 10,
        "dispute_category_id": 4,
        "dispute_name": "Testate Succession"
      },
      {
        "id": 11,
        "dispute_category_id": 4,
        "dispute_name": "Intestate Succession"
      }
    ]
  }
]
```

2. Create - Creating a new dispute category (For seeding DB)

   POST: `/api/dispute_categories`

     <hr />

### Dispute Types

1. Index - Get all types of disputes

   GET: `/api/dispute_types`

   Response:

```json
[
  {
    "id": 3,
    "dispute_category_id": 1,
    "dispute_name": "Guardianship"
  },
  {
    "id": 4,
    "dispute_category_id": 2,
    "dispute_name": "Trademark"
  },
  {
    "id": 7,
    "dispute_category_id": 3,
    "dispute_name": "Insolvency & Bankruptcy"
  },
  {
    "id": 14,
    "dispute_category_id": 5,
    "dispute_name": "Divorce & Separation"
  }
]
```

2. Create - Add a type of dispute associated to an dispute category (Used to seed DB)

   POST: `/api/dispute_types`

     <hr />

### Advocates

1. Sign Up - Register new advocate & creates a session for the user

   POST: `/api/advocates/signup`

   Response:

```json
{
  "id": 1,
  "name": "Biko",
  "email": "Biko@gmail.com",
  "phone": "33491303",
  "years_of_practice": 17,
  "pin_number": 664566,
  "disputes": []
}
```

2. Index - Returns a list of all advocates

   GET: `/api/advocates`

   Response:

```json
[
  {
    "id": 1,
    "name": "Jon",
    "phone": "48233817",
    "email": "jon@gmail.com",
    "years_of_practice": 4,
    "pin_number": 362258,
    "disputes": []
  },
  {
    "id": 2,
    "name": "Sylvia",
    "phone": "85981857",
    "email": "sylvia@gmail.com",
    "years_of_practice": 13,
    "pin_number": 348706,
    "disputes": [
      {
        "id": 9,
        "client_name": "Rhoda",
        "advocate_name": "Sylvia",
        "dispute_category_name": "Criminal Law",
        "dispute_description": "prescribes conduct perceived as threatening, harmful, or otherwise endangering to the property, health, safety, and moral welfare of people.",
        "dispute_info": "Failure is a bruise, not a tattoo.",
        "created": "2023-01-03 09:27:24 UTC"
      }
    ]
  }
]
```

3. Show - Returns current advocate data with associated disputes

GET: `/api/advocates/me`

```json
[
  {
    "id": 7,
    "name": "Sylvia",
    "phone": "85981857",
    "email": "sylvia@gmail.com",
    "years_of_practice": 13,
    "pin_number": 348706,
    "disputes": [
      {
        "id": 6,
        "client_name": "Cynthia",
        "advocate_name": "Sylvia",
        "dispute_category_name": "Intellectual Property Law",
        "dispute_description": "enable the owner of an intellectual property to exercise monopoly on the subject of the IP rights.",
        "dispute_info": "I’m Moby goddamn Dick, and you just swam in my waters",
        "created": "2023-01-03 09:27:24 UTC"
      }
    ]
  }
]
```

4. Login - Creates session with a pre-existing advocate

   POST: `/api/advocates/login`

   Response:

```json
{
  "id": 1,
  "name": "Anne",
  "email": "anne@gmail.com",
  "phone": "33491303",
  "years_of_practice": 17,
  "pin_number": 664566,
  "disputes": [
    {
      "id": 2,
      "client_name": "Cynthia",
      "advocate_name": "Njomo",
      "dispute_category_name": "Family Law",
      "dispute_description": "issues involving family relationships such as marriage and divorce.",
      "dispute_info": "When you work with tigers, once in a while they are going to take a swipe at you.",
      "created": "2023-01-03 09:27:24 UTC"
    }
  ]
}
```

5. Logout - Delete an active advocate's session

   DELETE: `/api/advocates/logout`

     <hr />

### Disputes

1.  Index - Returns all disputes

    GET: `/api/disputes`

```json
[
  {
    "id": 1,
    "client_name": "Mike",
    "advocate_name": "Meyers",
    "dispute_category_name": "Children Law",
    "dispute_description": "parental responsibility,fostering, adoption, custody, maintenance, guardianship, care and protection of children.",
    "dispute_info": "I don't play the odds, I play the man.",
    "created": "2023-01-03 09:27:24 UTC"
  },
  {
    "id": 2,
    "client_name": "Barbra",
    "advocate_name": "Kendi",
    "dispute_category_name": "Family Law",
    "dispute_description": "issues involving family relationships such as marriage and divorce.",
    "dispute_info": "You just got Litt up!",
    "created": "2023-01-03 09:27:24 UTC"
  }
]
```

    2. Show - Returns a specific dispute's data

       GET: `/api/disputes/:id`

       Response:

  ```json
  [
    {
      "id": 1,
      "client_name": "Brian",
      "advocate_name": "Biko",
      "dispute_category_name": "Children Law",
      "dispute_description": "parental responsibility,fostering, adoption, custody, maintenance, guardianship, care and protection of children.",
      "dispute_info": "You just got Litt up!",
      "created": "2023-01-03 09:27:24 UTC"
    }
  ]
  ```

    3. Create - Adds a new dispute record to the DB

       POST: `/api/disputes/create`

       Response:

  ```json
  [
    {
      "id": 1,
      "client_name": "Brian",
      "advocate_name": "Biko",
      "dispute_category_name": "Children Law",
      "dispute_description": "parental responsibility,fostering, adoption, custody, maintenance, guardianship, care and protection of children.",
      "dispute_info": "You just got Litt up!",
      "created": "2023-01-03 09:27:24 UTC"
    }
  ]
  ```

  <strong>NOTE: Only a logged in Advocate can UPDATE and DESTROY a dispute record</strong>

4. Destroy - Deletes a dispute record from the DB

  DELETE: `/api/disputes/:id`

5. Update - Changes values of a dispute record & reurns the updated version

  PATCH: `api/disputes/:id`

  Response:

  ```json
  [
    {
      "id": 1,
      "client_name": "Brian",
      "advocate_name": "Biko",
      "dispute_category_name": "Children Law",
      "dispute_description": "parental responsibility,fostering, adoption, custody, maintenance, guardianship, care and protection of children.",
      "dispute_info": "Case has been filed",
      "created": "2023-01-03 09:27:24 UTC"
    }
  ]
  ```

## Deployment

> Bycrpt is the technology used in authentication of users.

> Sessions (cookies) are used to enable the application to maintain user-specific state, while users interact with the application. For example, sessions allow users to authenticate once and remain signed in for future requests.

The whole application (FE and BE) will have to be bundled into a monolith application and deployed as one. This has been tried and tested on Railway.app and works as expected.

Reason being, sessions do not work cross platforms eg having the FE deployed on Vercel and BE on Render but works on the same site deployment.

To deploy both as one, on the FE, run ```npm run build``` and copy all the files created in the build folder and paste them in the `public` folder of the backend. 

You can now deploy the application. [Documentation on deploying the BE on Railway.app](https://docs.google.com/document/d/1eYrPpAhOO7HGV7qCc-z5WTiVzrs4cnaJIZe9OJoz6PY/edit?usp=sharing).
