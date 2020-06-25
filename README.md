# 5-0Cab

An online cab booking application for the North Bay 5-0 Cab company.

## Features:

- Integrates Bing Autosuggest to find the local buisness or address you wish to be picked up.
- Multiple cab assignment. Handles request sizes requiring multiple vehicles.
- Calling option for those special requests.
-

## As an API
Retreive Data 
```
\RetreiveRequests\?{request param}=[param value]
...
```


# TODO
### Developer Features:
- [ ] Gitignore including a class with public static private enviroment variable to keep hidden for End-User
### End User:
- [ ] Front Page Website: Content and photos ( Waiting on 5-0 Cab Owner )
- [ ] Contact-Us Page: Everything
- [ ] Request Form Page: Add a Cookie upon being confirmed. Check for active request, add fixed-bottom footer if one exists linking to the map  page.
- [ ] Map Page : Overhaul Completely, Move to Bing Maps Web V8 SDK, get all cabs for current request ID, using 
- [ ] Add checks for dispatcher being online, redirect to calling feature if not
### Dispatcher/Admin:
- [ ] Login, and reset password. 
- [ ] Dispatcher Page: Drop Down menu queried from all cabs page. Delete button that prompts a reason form to be submitted. Add ajax to submit button. On load, update database to reveal dispatcher is online.
- [ ] 
