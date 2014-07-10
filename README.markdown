# BigSkirmish API

## Authentication

When authenticating into BigSkirmish you must first have an API Key.
This API Key permits you, as a developer, to access the BigSkirmish API.
All requests must have the "API-KEY" header. 

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
 "password":"a_secure_password"}
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
    "token":"39cb0516-687GHE0194730f-4e8a-fd2b24835dd"}}
```

