<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Google Map</title>
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
  <div id="map" style="width:100%; height: 100vh;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHvjSqcmNdLlLaP9dPJilDm_XgPSnoAk8&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
    	 $.ajax({
    	url:"<%=request.getContextPath()%>/searchrentalshop.do",
		
		success:data=>{
		const station=data.split(")");
    	 for(let j=0;j<5;j++){
    	for(let i=0;i<station.length;i++){
			let p=station[i].split(",");
			console.log(station[i][j]);
    	}
			}
    	console.log(station[0][0]);
		},error:(request,m)=>{
			console.log(request);
		}
    	 })
    	 
    	
      var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
      var map = new google.maps.Map(
        document.getElementById('map'), {
          zoom: 12,
          center: seoul
        });
    }
    
  </script>
</body>
</html>

	