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
 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHvjSqcmNdLlLaP9dPJilDm_XgPSnoAk8&callback=initMap&region=kr"></script> <input type="hidden" id="rs0">
 
  <input type="hidden" id="mk1">
  <input type="hidden" id="mk2">
  <input type="hidden" id="mk3">
  <input type="hidden" id="mk4">
  <input type="hidden" id="mk5">
  
  <script>
var temp = new Array(5);
	
for (var i = 0; i < temp.length; i++) {
	      temp[i] = new Array(temp);
  	}
 
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
				//var station = new Array();
				console.log(1);
				
				
			
				var j = 0;
				data.forEach(v=>{
				let rentalShopId=v['rentalShopId'];
				let rentalShopName=v['rentalShopName'];
				let latitude=v['latitude'];
				let longitude=v['longitude'];
				let rentalShopAddress =v['rentalShopAddress'];
				//$("#crtfcNoCk").val(data);
				temp[j][0] = rentalShopId;
				temp[j][1] = rentalShopName;
				temp[j][2] = latitude;
				temp[j][3] = longitude;
				temp[j][4] = rentalShopAddress;
				j++;
				
			});
				  console.log(temp[1][1]);
				  initMap();
		}
				
	  })

  })  
  
function initMap() : void{
	  
	  //console.log($("#rs0").val());
	  //console.log(temp[0][1]);
     
      var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
      const station1 =new google.maps.LatLng(temp[0][2], temp[0][3]);
      const station2 = new google.maps.LatLng(temp[1][2], temp[1][3]);
      const station3 = new google.maps.LatLng(temp[2][2], temp[2][3]);
      const station4 = new google.maps.LatLng(temp[3][2], temp[3][3]);
      const station5 = new google.maps.LatLng(temp[4][2], temp[4][3]);
      
      
      var map = new google.maps.Map(
   	        document.getElementById('map'), {
  	        zoom: 15,
   	        center: station1
  	  });
      
    			     	        
      Marker1 = new google.maps.Marker({
    	    position: station1,
    	    map: map,
    	    label: temp[0][1]
    	  });
      
      /* Maker1.addEventListener("click",(e)=>{
    	  alert("이벤트");
      }); */
      
      Marker2 = new google.maps.Marker({
  	    position: station2,
  	    map: map,
  	    label: temp[1][1]
  	  });
      
      Marker3 =new google.maps.Marker({
  	    position: station3,
	    map: map,
	    label:temp[2][1]
	  });
  	  
      Marker4 =new google.maps.Marker({
  	    position: station4,
	    map: map,
	    label: temp[3][1]
	  });
	  
      Marker5 = new google.maps.Marker({
  	    position: station5,
	    map: map,
	    label: temp[4][1]
	  });
      
}
      
      /* map.addListener("center_changed", () => {
    	    // 3 seconds after the center of the map has changed, pan back to the
    	    // marker.
    	    window.setTimeout(() => {
    	      map.panTo(marker.getPosition() as google.maps.LatLng);
    	    }, 3000);
    	  });

    	  marker.addListener("click", () => {
    	    map.setZoom(8);
    	    map.setCenter(marker.getPosition() as google.maps.LatLng);
    	  });
    	} */
      	
  
      
	 /*  Marker marker5=new google.maps.Marker({
	  	    position: station5,
		    map: map,
		    label: temp[4][1]
		  }); */
    /* 
	  marker.addListener("click", () => {
		    infowindow.open({
		      anchor: marker,
		      map,
		      shouldFocus: false,
		    });
		  }); */

	  /* 
	  Marker melbourne = map.addMarker(
	      new MarkerOptions()
	          .position(melbourneLatLng)
	          .title("Melbourne"));
	  melbourne.showInfoWindow(); */
    
  
  
  
  /* 
  var locations = [
      
      //경복궁 마커
      ['<div class="wrap"><div class="text-box"><h4>경복궁</h4><div class="img-box"><img src="https://image.shutterstock.com/image-vector/palace-icon-outline-vector-web-260nw-1046855677.jpg"></div><a target="_blank" href="https://www.royalpalace.go.kr/"><p>홈페이지 방문하기</p></a></div>', 37.577624, 126.976020],
      
      
      //딸기케이크 마커
      ['<div class="wrap"><div class="text-box"><h4>딸기케이크</h4><div class="img-box"><img src="https://media.istockphoto.com/vectors/piece-of-cake-with-strawberries-icon-element-of-bakery-icon-premium-vector-id931551700"></div><a target="_blank" href="https://noa-xyz.tistory.com"><p>홈페이지 방문하기</p></a></div>', 37.559524, 126.976710],
      
      
      //창덕궁 마커
      ['<a target="_blank" href="https://cdg.go.kr/">창덕궁 홈페이지</a>', 37.579711, 126.991043]
      
      
      ]

  
  
  //마커 이미지
  var customicon = 'http://drive.google.com/uc?export=view&id=1tZgPtboj4mwBYT6cZlcY36kYaQDR2bRM'

  //인포윈도우
  var infowindow = new google.maps.InfoWindow();

  //마커 생성
  var marker, i;
  for (i = 0; i < locations.length; i++) {
      marker = new google.maps.Marker({
          
          //마커의 위치
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
          
          //마커 아이콘
          icon: customicon,
          
          //마커를 표시할 지도
          map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
              
              //html로 표시될 인포 윈도우의 내용
              infowindow.setContent(locations[i][0]);
              
              //인포윈도우가 표시될 위치
              infowindow.open(map, marker);
          }
      })(marker, i));
      
          marker.addListener('click', function() {
              
              //중심 위치를 클릭된 마커의 위치로 변경
              map.setCenter(this.getPosition());

              //마커 클릭 시의 줌 변화
              map.setZoom(14);
          });
      }
  }
} */

  </script>
  
  
</body>
</html>

	