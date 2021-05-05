/*
 * Get Data from ARTSAT API 
 * 
 */

import processing.net.*;

String data;

XML artsat, results, item, sensors;
float lat, lon, tin;

void setup() {
  size(200, 200);
  background(50);
  fill(200);
}

void draw() {
  data = join(loadStrings("http://api.artsat.jp/web/v2/invader/sensor_data.xml?intrpl=linear&sensor=lat,lon,tin"), ""); 

  artsat = parseXML(data);
  if (artsat == null) {
    println("XML could not be parsed.");
  }
  else {
    results = artsat.getChild("results");
    item = results.getChild("item");
    sensors = item.getChild("sensors");
    
    lat = float(sensors.getChild("lat").getChild("value").getContent());
    println(lat);

    lon = float(sensors.getChild("lon").getChild("value").getContent());
    println(lon);

    tin = float(sensors.getChild("tin").getChild("value").getContent());
    println(tin);
    
  };

  delay(10000);
}
