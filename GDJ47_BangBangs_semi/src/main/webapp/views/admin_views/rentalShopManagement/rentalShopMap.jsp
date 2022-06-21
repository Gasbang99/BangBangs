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
 <!--  <input type="hidden" id="rs0">
  <input type="hidden" id="rs1">
  <input type="hidden" id="rs2">
  <input type="hidden" id="rs3">
  <input type="hidden" id="rs4"> -->
  <script>
  $(()=>{
	  $.ajax({
		  	<%-- url:"<%=request.getContextPath()%>/searchrentalshop.do",
				success:data=>{
					console.log(data);
		  	} --%>
				
		  	url:"<%=request.getContextPath()%>/ajaxsearchrentalshop.do",
			success:data=>{
				console.log(data);
				console.log(data.length);
				var satation = new Array();
				console.log(1);
				data.forEach(v=>{
				let rentalShopId=v['rentalShopId'];
				let rentalShopName=v['rentalShopName'];
				let latitude=v['latitude'];
				let longitude=v['longitude'];
				let rentalShopAddress =v['rentalShopAddress'];
				/* console.log(rentalShopId);
				console.log(rentalShopName);
				console.log(latitude);
				console.log(longitude);
				console.log(rentalShopAddress); */
				
				
			});
				console.log(v[0][0]);
		}
				
	  })
  })
    function initMap() {
	  
	  //console.log($("#rs0").val());
    	 
    	
      var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
      var map = new google.maps.Map(
        document.getElementById('map'), {
          zoom: 14,
          center: seoul
        });
      
      new google.maps.Marker({
    	    position: seoul,
    	    map: map,
    	    label: "서울 중심 좌표"
    	  });
      
      new google.maps.Marker({
  	    position: seoul,
  	    map: map,
  	    label: "서울 중심 좌표"
  	  });
      
      new google.maps.Marker({
  	    position: seoul,
	    map: map,
	    label: "서울 중심 좌표"
	  });
  	  
  	  new google.maps.Marker({
  	    position: seoul,
	    map: map,
	    label: "서울 중심 좌표"
	  });
	  
	  new google.maps.Marker({
  	    position: seoul,
	    map: map,
	    label: "서울 중심 좌표"
	  });
      
      
      
      
    }
    
  </script>
</body>
</html>

	