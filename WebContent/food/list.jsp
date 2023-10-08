<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="./assets/css/main.css" />
    <link rel="stylesheet" href="./assets/css/footer.css" />
</head>
<body>


<% 
	String foodListJson = (String)request.getAttribute("foodList");
	
	if (foodListJson != null && !foodListJson.isEmpty()) {
%>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c19302fd8634ec8527c3e7ec2145b2b"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.841103, 128.20518), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var items = <%= foodListJson %>;
	var positions = new Array();
	
	makeMap(items, "./assets/img/filter01_pin.png");
	
	function makeMap(items, imageSrc) {
		console.log(items);
		var slideList = new Array();
		
		for (const item of items) {
			const position = {
			  title: item.title,
			  latlng: new kakao.maps.LatLng(item.mapy, item.mapx), // 주의: 위도와 경도 순서가 바뀌었습니다.
			};
		positions.push(position);
		
		
		const slide = {
			  	  title: item.title,
			  	  address: item.addr1,
			  	  image: item.image,
			  	  distance : item.distance
			  	};
	  	slideList.push(slide);
		}
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    var imageSize = new kakao.maps.Size(64, 69);
		  	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		map.panTo(positions[0].latlng);
		
		movePhoto(slideList);
	}
	
	  
	  
  function movePhoto(slideList) {
	  let side = document.querySelector(".side");
	  side.style.transform = "translateX(0)";
	  while (side.firstChild) {
	    side.removeChild(side.firstChild);
	  }
	  var cnt = 0;
	  var i = -1;
	  let row = document.createElement("div"); // 한 행을 나타내는 div 요소
	  row.style.display = "flex"; // Flexbox 레이아웃을 사용하여 요소를 옆으로 나열
	  
	  while (cnt < 5) {
	    if (slideList[++i].image != '') {
	      let temp = document.createElement("div");

	      let img = document.createElement("img");
	      img.style.borderRadius = "10px"; // 원하는 값으로 설정
	      
	      img.src = slideList[i].image;

	      let title = document.createElement("div"); // "storeTitle" 클래스 추가
	      title.innerHTML = '<h3>' + slideList[i].title + '</h3>'

	      let addr = document.createElement("div"); // "storeAddr" 클래스 추가
	      addr.innerHTML = slideList[i].address;

	      let dist = document.createElement("div");
	      dist.innerHTML = slideList[i].distance + 'km';
	      
	      temp.appendChild(img);
	      temp.appendChild(title);
	      temp.appendChild(addr);
	      temp.appendChild(dist);
	      
	      cnt++;
	      row.appendChild(temp);
	    }
	    side.appendChild(row);
	  }
	}
  
	  var slideElements = document.querySelectorAll('.slide');
	  slideElements.forEach(function (slide) {
	    slide.addEventListener('click', function (event) {
	      //location.reload();	
	      //event.preventDefault(); // 기본 동작 취소
	      
	      
	      var foodType = this.getAttribute('data-food-type');
	      
	      var name = './assets/img/filter' + foodType + '_pin.png';
	      makeMap(items, name);
	    });
	  });
</script>
</body>



<% } %>
	
</body>
</html>
<script src="./assets/js/location_option.js"></script>