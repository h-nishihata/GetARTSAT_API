/*
 * Get Data from ARTSAT API 
 * 
 */

import processing.net.*;

XMLElement artsat, results, item, sensors;
float lat, lon, tin;

void setup() {
  size(200, 200);
  background(50);
  fill(200);
}

void draw() {
  artsat = new XMLElement(this, "http://api.artsat.jp/web/v2/invader/sensor_data.xml?intrpl=linear&sensor=lat,lon,tin");

  results = artsat.getChild("results");
  item = results.getChild("item");
  sensors = item.getChild("sensors");

  lat = float(sensors.getChild("lat").getChild("value").getContent());
  println(lat);

  lon = float(sensors.getChild("lon").getChild("value").getContent());
  println(lon);

  tin = float(sensors.getChild("tin").getChild("value").getContent());
  println(tin);

  delay(10000);
}

