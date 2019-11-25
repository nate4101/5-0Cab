/**
 * 
 */

var mymap = L.map('mapid').setView([46.309460, -79.461632], 13);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibmF0ZTQxMDEiLCJhIjoiY2szZWpnNmRyMWEwdjNkcWUxZ3hpdXZociJ9.Vt5upqpyXQq87YIlGkDYdg', {
    attribution: 'Map data &copy;' +
    	'<a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
    	'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, '+
    	'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
}).addTo(mymap);