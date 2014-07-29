# BigSkirmish API

## Register to Obtain API Key
All requests must have the "API-KEY" header to be permitted. If you do
not have an API Key you can obtain one at
www.bigskirmish.com/developer/register.

## Authentication With API Key
All request have an API Key header that is passed like this:  

`"API-KEY: your_api_key"  

If you do not have an API Key header, with a valid API Key as the value,
your request will respond back with a 404 status.

## Endpoints  

### Create User

#### REQUEST  
**HTTP Method:** `POST`  
**URL Endpoint:** `/users`  
**Body:**  
```
{"first_name":"Walter",
 "last_name":"White",
 "username":"heisenberg",
 "email":"heisenberg@thesilkroad.com",
 "password":"a_secure_password"
}
```

#### RESPONSE  
**HTTP Status Code:** 201  
```
{"user":
   {"id":1,
    "first_name":"Walter",
    "last_name":"White",
    "username":"heisenberg",
    "email":"heisenberg@thesilkroad.com",
    "token":"39cb0516-687GHE0194730f-4e8a-fd2b24835dd"
   }
}
```

### Show User  

#### REQUEST  
**HTTP Method:** `GET`  
**Headers:** `"Authorization:Token token='39cb0516-687GHE0194730f-4e8a-fd2b24835dd'"`  
**URL Endpoint:** `/users/:user_id`  
**Body:** no body  

#### RESPONSE  
**HTTP Status Code:** 200  
```
{"user":
   {"id":1,
    "first_name":"Walter",
    "last_name":"White",
    "username":"heisenberg",
    "email":"heisenberg@thesilkroad.com",
    "token":"39cb0516-687GHE0194730f-4e8a-fd2b24835dd"
   }
}
```

### Create War
**HTTP Method:** GET  
**Headers:** `"Authorization:Token token='39cb0516-687GHE0194730f-4e8a-fd2b24835dd'"`  
**URL Endpoint:**`/users/:user_id/wars`  
**Body:**
```
{"war":
  {"name":"Darts",
   "has_end":true,
   "ending_date":1406786400,
   "ending_score":4,
   "prize":"Loser buys dinner",
   "is_private":false,
   "open_registration":false
  }
}
```



First Time Registrant:
- Requests have API Key
- Registers by passing username/password
- Writes to token for user
  - Token is passed back in create response
- Next requests have API Key header and Authorization Header for token

All Subsequent Uses:
- Enters username/password and reads user token for session
- Pass user token from then on out to register.
- If user logs out it sets the token to nil
