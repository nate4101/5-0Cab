function loadMapScenario() {
	
	navigator.geolocation.getCurrentPosition(success, error);
	var options;
	// UserLocation object may be wrong
		function error(position){
			console.log("in error");
			var loc = new Microsoft.Maps.Location(46.3091, -79.4608);
			options = {maxResults: 5, userLocation: loc, businessSuggestions: true};
		autoSuggest();
		}
		function success(position){
			console.log("in success");
			var loc = new Microsoft.Maps.Location(position.coords.latitude, position.coords.longitude);
			options = {maxResults: 5, userLocation: loc, businessSuggestions: true};
			autoSuggest();
		}
		function autoSuggest(){
                Microsoft.Maps.loadModule('Microsoft.Maps.AutoSuggest', {
                    callback: onLoad,
                    errorCallback: onError
                });
                function onLoad() {
                	console.log(options);
                	/**
                	 * Attach an Autosuggestmanager to an HTML element
                	 * method: .attachAutosuggest(string, string, function)
                	 * param: suggestionBoxId: string 'The HTML element identifier of the input box.'
                	 * suggestionContainerId: string 'The Id of container where suggestions will be displayed.'
                	 * selectedSuggestionCallback: function(result:SuggestionResult)) 'Function to call when a suggestion is selected, passes the suggestion object as the only paramater
                	 */
                    var manager = new Microsoft.Maps.AutosuggestManager(options);
                    manager.attachAutosuggest('#searchBox', '#searchBoxContainer', selectedSuggestion);
                }
                // Error function, when something goes wrong, for now, refresh the page
                function onError(message) {
                	console.log(message);
                    alert("Please Refresh the page");
                }
                function selectedSuggestion(suggestionResult) {
                	console.log(suggestionResult);
                	// Update hidden elements
                	document.getElementById('location').value = suggestionResult.title+", "+suggestionResult.address.addressLine+", "+suggestionResult.address.locality;
                	console.log(document.getElementById('location').value);
                	document.getElementById('coords').value=suggestionResult.location.latitude+","+suggestionResult.location.longitude;
                	console.log(document.getElementById('coords').value);
                }
		}
}