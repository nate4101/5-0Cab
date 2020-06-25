# 5-0Cab

An online cab booking application for the North Bay 5-0 Cab company.
Request a cab, view the the cab on the map.

## Features:

- Autosuggest uses geolocation to prioritize autosuggests to your area. Find local buisnesses or addresses you wish to be picked up.
- Multiple cab assignment. Handles request sizes greater than 6 requiring multiple vehicles.
- Calling option for those special requests.
- Live Map with all cabs coming to your position.
- Estimated Wait time for the furthest cab away.
- Tell the cab where your going when it arrives and pay with visa in the cab.
- No sensitive data being stored.


## As an API
Retreive Data 
```
Get: ...\RetrieveRequests\? {param id} = [param value] & key=[your_key]
```



# TODO
### Developer Features:
- [ ] Gitignore including a class with public static private enviroment variable to keep hidden for End-User
- [ ] Add logging features to each page
- [ ] Using new database C.R.U.D schema rewrite DBHelper
### End User:
- [ ] Front Page Website: Content and photos ( Waiting on 5-0 Cab Owner )
- [ ] Contact-Us Page: Add a form that when submitted send an email to the owner with the details.
- [ ] Request Form Page: Add a Cookie upon being confirmed. Check for active request, add fixed-bottom footer if one exists linking to the map page.
- [ ] Map Page : Overhaul Completely, Move to Bing Maps Web V8 SDK, get all cabs for current request ID, using geotab API helper. When cab location is close to your location ~10-20m radius, the request times out and sends an html audio single it has arrived.
- [ ] Add checks for dispatcher being online, redirect to calling feature if not online.
### Dispatcher/Admin:
- [ ] Login, and reset password. 
- [ ] Dispatcher Page: Drop Down menu queried from all cabs page. Delete button that prompts a reason form to be submitted. Add ajax to submit button. On load, update database to reveal dispatcher is online.
- [ ] 
