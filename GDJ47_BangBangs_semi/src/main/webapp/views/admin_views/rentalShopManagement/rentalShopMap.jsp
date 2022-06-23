<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<body>
  <div id="map" style="width:100%; height: 80vh;"></div>
 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHvjSqcmNdLlLaP9dPJilDm_XgPSnoAk8&callback=initMap&region=kr"></script> <input type="hidden" id="rs0">
 
  <input type="hidden" id="rs1">
  <input type="hidden" id="rs2">
  <input type="hidden" id="rs3">
  <input type="hidden" id="rs4">
  
  <script>
const rs = new Array(5);
	
for (let i = 0; i < rs.length; i++) {
	      rs[i] = new Array(rs);
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
				
				
			
				let j = 0;
				data.forEach(v=>{
				let rentalShopId=v['rentalShopId'];
				let rentalShopName=v['rentalShopName'];
				let latitude=v['latitude'];
				let longitude=v['longitude'];
				let rentalShopAddress =v['rentalShopAddress'];
				//$("#crtfcNoCk").val(data);
				rs[j][0] = rentalShopId;
				rs[j][1] = rentalShopName;
				rs[j][2] = latitude;
				rs[j][3] = longitude;
				rs[j][4] = rentalShopAddress;
				j++;
				
			});
				  console.log(rs[1][1]);
				  initMap();
		}
				
	  })

  })  
  

function initMap() {
	  
	  //console.log($("#rs0").val());
	  console.log(rs[0][1]);
     
	  const seoul = { lat: 37.5642135 ,lng: 127.0016985 };
      const station1 =new google.maps.LatLng(rs[0][2], rs[0][3]);
      const station2 = new google.maps.LatLng(rs[1][2], rs[1][3]);
      const station3 = new google.maps.LatLng(rs[2][2], rs[2][3]);
      const station4 = new google.maps.LatLng(rs[3][2], rs[3][3]);
      const station5 = new google.maps.LatLng(rs[4][2], rs[4][3]);
      
      const map = new google.maps.Map(
     	        document.getElementById('map'), {
    	        zoom: 15,
     	        center: station1
    	  });
        
      			     	        
        Marker1 = new google.maps.Marker({
      	    position: station1,
      	    map: map,
      	    label: rs[0][1]
      	  });
        
        /* Maker1.addEventListener("click",(e)=>{
      	  alert("이벤트");
        }); */
        
        Marker2 = new google.maps.Marker({
    	    position: station2,
    	    map: map,
    	    label: rs[1][1]
    	  });
        
        Marker3 =new google.maps.Marker({
    	    position: station3,
  	    map: map,
  	    label:rs[2][1]
  	  });
    	  
        Marker4 =new google.maps.Marker({
    	    position: station4,
  	    map: map,
  	    label: rs[3][1]
  	  });
  	  
        Marker5 = new google.maps.Marker({
    	    position: station5,
  	    map: map,
  	    label: rs[4][1]
  	  });
    
    } /* 
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
      
      if (marker) {
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
  
          <%@ include file="/views/common/footer.jsp" %>
	