### BigSkirmish

#### Authentication

When authenticating into BigSkirmish you must first have an API Key.
This API Key permits you, as a developer, to access the BigSkirmish API.
All requests must have the "API-KEY" header. 

#### Create User

HTTP Method: `POST`  
URL: `/users`
Body:
```
{"first_name":"Walter",
 "last_name":"White",
 "username":"heisenberg",
 "email":"heisenberg@thesilkroad.com",
 "password":"a_secure_password"}
```

 
