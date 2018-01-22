// Assignment 6
// Names: Misael Santana and Harry Bhasin
// This assignment uses public map APIs available for maps using the unfolding library.
// Temboo library is used to connect the public web APIs with Processing

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.*; // for earth style map
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.utils.*;


//API
import com.temboo.core.*;
import com.temboo.Library.Google.Geocoding.*;

// Create a session using your Temboo account application details
TembooSession session = new TembooSession("mlsm", "myFirstApp", "b40W7A9mQu0i7IIjWl9DklSJaOBDo7fe");


import java.math.BigDecimal;

DebugDisplay debugDisplay;
UnfoldingMap map;
String s="";

void setup()  {
  size(800,600);

  //map = new UnfoldingMap(this,new Google.GoogleMapProvider()); //not working https://github.com/tillnagel/unfolding/issues/73
  //map = new UnfoldingMap(this,new Google.GoogleTerrainProvider()); //not working
  //map = new UnfoldingMap(this,new OpenStreetMap.OpenStreetMapProvider());
  // get the map entry
  map = new UnfoldingMap(this, new Microsoft.HybridProvider());
  //map = new UnfoldingMap(this, new Microsoft.AerialProvider());
  //map=new UnfoldingMap(this);

  MapUtils.createDefaultEventDispatcher(this, map);

  Location CenterLocation=new Location(38,-95);

  map.zoomAndPanTo(CenterLocation,4);

  //float maxPanningDistance=50;  //in km
  //map.setPanningRestriction(CenterLocation,maxPanningDistance);
  //map.setZoomRange(12, 18);

  map.setTweening(true);

  debugDisplay = new DebugDisplay(this, map);
}

void draw()  {
    background(1);
    map.draw(); 
    debugDisplay.draw();
    fill(1);
    quad(
      width/2-150, height-30, 
      width/2+150, height-30, 
      width/2+150, height,
      width/2-150, height);
      fill(0, 180, 0);
      text(s,width/2-140,height-10); 
    //fill (1);

    //map.draw();
}

// Get the location from the mouse click
void mouseClicked() {

   double lat;
   double lon;

   // position showing
   Location location = map.getLocation(mouseX, mouseY);

   // find lattitude and longiture
   lat = location.getLat();
   lon = location.getLon();

   // print(lat+","+lon);

   runGeocodeByCoordinatesChoreo(lat, lon);
}


// create the precise choreography and the resulting address
void runGeocodeByCoordinatesChoreo(double lat, double lon) {

  // Create the Choreo object using the Temboo session
  GeocodeByCoordinates geocodeByCoordinatesChoreo = new GeocodeByCoordinates(session);
  //print(lat+","+lon);
  BigDecimal blat=new BigDecimal(lat);
  BigDecimal blon=new BigDecimal(lon);
  // Set inputs
  geocodeByCoordinatesChoreo.setLatitude(blat);
  geocodeByCoordinatesChoreo.setLongitude(blon);

  // Run the Choreo and store the results
  GeocodeByCoordinatesResultSet geocodeByCoordinatesResults = geocodeByCoordinatesChoreo.run();
  
  // print address on the console
  // println(geocodeByCoordinatesResults.getFormattedAddress());
  // println(geocodeByCoordinatesResults.getResponse());

  s = geocodeByCoordinatesResults.getFormattedAddress();
  // println(s);
}
