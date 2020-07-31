# 5-0Cab [5-0cab.ca](http://fivezerocabbookingapp-env.eba-txkffpzh.ca-central-1.elasticbeanstalk.com/)

An online cab booking application for the North Bay 5-0 Cab company.
Request a cab, to your location, view it on a map as it travels to you. Notifies you when it arrives.

## Features:

- Autosuggest uses geolocation to prioritize autosuggests to your area. Find local buisnesses or addresses you wish to be picked up.
- Multiple cab assignment. Handles request sizes greater than 6 requiring multiple vehicles.
- Calling option for those special requests.
- Live Map with all cabs coming to your position.
- Estimated Wait time for the furthest cab away. HTML audio notification when cab is within threshold of pickup
- Tell the cab where your going when it arrives and pay with visa in the cab.
- No sensitive data being stored.


## As an API
Retreive Data 
```
Get: ...\RetrieveRequests\? {param id} = [param value] & key=[your_key]
```



# TODO
### Developer Code To prioritize:
- [ ] Update all post methods to follow a PRG pattern, or use ajax, redirect upon success (probabaly more user friendly)
- [ ] Update all Servlets to properly server data. Json for retreive all/ retreive select, plain text for dispatcherOnline, and cab serial and cabnums
- [ ] Add logs to all endpoints
- [ ] Overhaul old login system for java using: PBKDF2 with hashing for passwords. Set an envrioment variable in request object and check against database secure value.
- [x] Gitignore including a class with public static private enviroment variable to keep hidden for End-User
- [x] Using new database C.R.U.D schema rewrite DBHelper
- [x] Add logging features to each DBHelper Method
## Page Updates:
### End User:
- [ ] Front Page Website: Content and photos ( Waiting on 5-0 Cab Owner )
- [ ] Contact-Us Page: Add a form that when submitted send an email to the owner with the details.
- [ ] Request Form Page: Add a Cookie upon being confirmed. Check for active request, add fixed-bottom footer if one exists linking to the map page. Add Recaptcha token
- [ ] activeRequest.jsp : Overhaul Completely, Move to Bing Maps Web V8 SDK, get all cabs for current request ID, using geotab API helper. When cab location is close to your location ~10-20m radius, the request times out and sends an html audio single it has arrived.
- [ ] Add checks for dispatcher being online, redirect to calling feature if not online.
- [ ] How to Book a cab: (Static?) Page with step by step instructions on how to use the service
### Dispatcher/Admin:
- [ ] Login, and reset password. 
- [ ] Dispatcher Page: Drop Down menu queried from all cabs page. Delete button that prompts a reason form to be submitted. Add ajax to submit button. On load, update database to reveal dispatcher is online, on leave, set dispatcher to false
- [ ] ...
### Low Priority Developer:
- [ ] Remove current 5-0cab.ca hosting, free up that domain, or reroute it to the new page hosted on amazon.
- [ ] SSL certificate ->
- [ ] After SSL certificate, veryify all cdn and scripts especially bing is using https
- [ ] Amazon load balancing to prevent DDOS attacks
- [ ] What do I need for a EULA? Make a EULA...

https://www.google.com/recaptcha/admin/site/431538187
