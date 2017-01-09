# Calculate distance between two geometrical points whose latitude and longitude values are provided

```
<?php

class DistanceBetweenTwoPoints {

	//To find the distance between two geographical coordinates
	function distance($lat1, $lon1, $lat2, $lon2) {

		$theta = $lon1 - $lon2;
		$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
		$dist = acos($dist);
		$dist = rad2deg($dist);
		$miles = $dist * 60 * 1.1515;
		
		return (($miles * 1.609344) * 1000.00); // Returns distance as float value
	}
}

?>
```