package helper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * 
 * @method readJsonFromUrl(String url)
 *
 */
public class JSONhelper {
	/**
	 * 
	 * @param url - string as a URL on the world wide web to read a stream of data from
	 * @return JSONObject containing all data read from the stream as a JSON object
	 * @throws IOException - Error reading data
	 * @throws JSONException - Error in format, not registered as JSON
	 */
	public JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			StringBuilder sb = new StringBuilder();
			int cp;
			while ((cp = rd.read()) != -1) {
				sb.append((char) cp);
			}
			String jsonText = sb.toString();
			JSONObject json = new JSONObject(jsonText);
			return json;
		} finally {
		is.close();
		}
	}
}
