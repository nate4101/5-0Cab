            var map;
            var layerGroup;
            document.addEventListener("DOMContentLoaded", function () {
                // Initialize MapBox engine (http://www.mapbox.com)
                L.mapbox.accessToken = "pk.eyJ1IjoiZ2VvdGFiIiwiYSI6ImNpd2Nlam5tajA2cHIyenBmdDQyZG9mMGYifQ.I7NikOui41_ka1TbbFGkFw";
                map = L.mapbox.map("map").setView([46.3091, -79.461632], 13);
                L.mapbox.styleLayer("mapbox://styles/mapbox/streets-v10").addTo(map);
                layerGroup = L.layerGroup().addTo(map);
                document.getElementById("search").addEventListener("click", function (event) {
                    event.preventDefault();
                    var deviceSerial = document.getElementById("deviceSerial").value;
                    // Use Geotab API to search by serial number
                    if (deviceSerial == "") {
                        alert("Serial number is required");
                    } else {
                        api.call("Get", {
                            typeName: "Device",
                            search: {
                                serialNumber: deviceSerial
                            }
                        }, function (result) {
                            if (result.length > 0) {
                                showDeviceLocation(result[0]);
                            } else {
                                alert("Could not find a device for that serial number");
                            }
                        }, function (error) {
                            alert(error);
                        });
                    }
                });
            });
            // Retrieves the current location of a device and displays it on MapBox
            function showDeviceLocation(device) {
                api.call("Get", {
                    typeName: "DeviceStatusInfo",
                    search: {
                        deviceSearch: {
                            id: device.id
                        }
                    }
                }, function (result) {
                    var location = new L.LatLng(result[0].latitude, result[0].longitude);
                    var marker = L.marker(location).bindPopup(
                        "<strong>" + device.name + "</strong><br />" +
                        location.lat + ", " + location.lng);
                    layerGroup.clearLayers().addLayer(marker);
                    map.setView(location, 15);
                }, function (error) {
                    alert(error);
                });
            }