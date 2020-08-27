package helper;

import java.io.IOException;

import org.json.JSONException;
import org.json.JSONObject;
/**
 *
 * @author Nathan Young 2020
 *
 * @note<b> Use of this class as is is to use my public key dedicated for research purposes. The key has a yearly use limit, and I would like to not exceed it.</b>
 * 		<p> The URL and api still work if you generate your own key from BINGS MAPS API at: </p>
 * <a href="https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key"> Get a Bing Maps Key </a>
 */
public class BingApiHelper {
    private final static String API_KEY = "key=Ao77E8HCP8GxqLhthr-3IIuFJb4Ct3z1scaismPbqFOh3kZhqDT4kqUxssNP2hTR";

    /**
     * Get the nearest
     * @param lat
     * @param lon
     * @return
     */
    public static String findLocationFromGPSCoordinate(double lat, double lon){
        String URL = "http://dev.virtualearth.net/REST/v1/Locations/"+String.valueOf(lat)+String.valueOf(lon)+"?includeEntityTypes=Address&"+API_KEY;
        String location ="";
        return location;
    }
    /**
     * Get the latitude and longitude of an address in north bay through bing maps api.
     *
     * @param address - example) "13 Oakdale" or "13 Oakdale Road"
     * @return {lattitude of address in north bay, longitude of address in north bay}
     * @Error return {null, null} if address can not be resolved to North Bay Location
     * @Note Final URL converts spaces to %20 as required by Uniform Resource Locators
     */
    public static Double[] get_NorthBay_GPS_Location_From_StreetAddress(String address){
        String URL = "http://dev.virtualearth.net/REST/v1/Locations/CA/ON/P1B/North%20Bay/"+address+"?"+API_KEY;
        // Replace spaces with %20
        URL = URL.trim().replaceAll("\\s", "%20");
        JSONhelper jsh = new JSONhelper();
        JSONObject json = null;
        try {
            json = jsh.readJsonFromUrl(URL);
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // Get Coordinates from bing maps JSON
        // yes this is ugly... refer to Get Bing Maps Api Example.txt
        // or see distanceMatrix below, its the same process just not one-liner-ed
        String coordinateString = new JSONObject(new JSONObject(new JSONObject(json.get("resourceSets").toString().substring(1,json.get("resourceSets").toString().length()-1)).get("resources").toString().substring(1,new JSONObject(json.get("resourceSets").toString().substring(1,json.get("resourceSets").toString().length()-1)).get("resources").toString().length())).get("point").toString()).get("coordinates").toString();
        Double lat = Double.parseDouble(coordinateString.substring(1,coordinateString.indexOf(",")));
        Double lon = Double.parseDouble(coordinateString.substring(coordinateString.indexOf(",")+1,coordinateString.length()-1));
        if(Double.compare(lat, 46.38011932373047)==0 && Double.compare(lon, -79.38024139404297)==0)
        {
            System.out.println("Error parsing GPS_Location for: "+address+"... Returning null!");
            lat = null;
            lon = null;
        }
        //System.out.println("Success parsing GPS_Location for: "+address+". Coordinates: "+lat+", "+lon);
        Double[] coordsDoubles = {lat, lon};
        return coordsDoubles;
    }
    /**
     *  Uses Bing Maps API to compute travel distance between sets of longitude and latitude coordinates at some start time
     *  Depending on start time, travel duration will change based on historic traffic data, or predictive traffic data for future
     *
     * @param lat1,lon1 - start location to compute the travel distance between
     * @param lat2,lon2 - end location to compute the travel distance between
     * @return [distance(km),  time(minutes)] from l1 to l2
     * @throws Exception throws exception if path doesn't exist
     */
    public static Double[] DistanceMatrixCalulator(double lat1, double lon1, double lat2, double lon2) throws Exception
    {
        // Create URL and open connection to receive JSON
        String URL = "https://dev.virtualearth.net/REST/v1/Routes/DistanceMatrix?";
        String originString = "origins="+String.valueOf(lat1)+","+String.valueOf(lon1);
        String destinations="&destinations="+String.valueOf(lat2)+","+String.valueOf(lon2);
        String travelmode ="&travelMode=driving";
        String key = "&"+API_KEY;
        URL+=originString+destinations+travelmode+key;
        // Replace spaces with %20
        URL = URL.trim().replaceAll("\\s", "%20");
        JSONhelper jsh = new JSONhelper();
        JSONObject json = null;
        try {
            json = jsh.readJsonFromUrl(URL);
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // Iteratively search through the json to find travelDuration and travelDistance key value pairs
        String resourceSet = json.get("resourceSets").toString();
        json = new JSONObject(resourceSet.substring(1,resourceSet.length()-1));
        String resources = json.get("resources").toString();
        json = new JSONObject(resources.substring(1,resources.length()-1));
        String results = json.get("results").toString();
        json = new JSONObject(results.substring(1,results.length()-1));
        Double travelDistance = json.getDouble("travelDistance");
        Double travelDuration = json.getDouble("travelDuration");
        //System.out.println(travelDuration+"  "+travelDistance);
        Double[] dis = {travelDistance,travelDuration};
        // Checks if
        if(dis[0]<0 || dis[1]<0)
        {
            {
                StackTraceElement[]  error = {new StackTraceElement("BingAPIHelper.Java", "DistanceMatrixCalculator", null, 85)};
                Throwable  throwedError = new Throwable();
                throwedError.setStackTrace(error);
                throw new Exception("Error with URL: "+URL+" Try it yourself on Google Chrome.", throwedError);

            }
        }
        return dis;
    }
}