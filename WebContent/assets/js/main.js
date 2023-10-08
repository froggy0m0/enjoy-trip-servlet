var slideElements = document.querySelectorAll('.slide');
slideElements.forEach(function (slide) {
  slide.addEventListener('click', function (event) {
//    event.preventDefault(); // 기본 동작 취소
    var foodType = this.getAttribute('data-food-type');
    
    var name = './assets/img/filter' + foodType + '_pin.png';
    makeMap(areaId, `./img/filter${foodType}_pin.png`,foodType[1]);
  });
});



function makeMap(items, imageSrc) {
	imageSrc = `./img/filter01_pin.png`;
	var slideList = new Array();
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div
	mapOption = {
		center: new kakao.maps.LatLng(36.3890161659, 127.35127), // 지도의 중심좌표
		level: 9, // 지도의 확대 레벨
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var positions = new Array();
	for (const item of items) {
	const position = {
	  title: item.title,
	  latlng: new kakao.maps.LatLng(item.mapy, item.mapx), // 주의: 위도와 경도 순서가 바뀌었습니다.
	  image: item.image
	};
	positions.push(position);
	
	const slide = {
  	  title: item.title,
  	  address: item.address,
  	  image: item.image,
  	  distance : item.distance
  	};
	slideList.push(slide);
	
	}
	movePhoto(slideList);
	
	for (var i = 0; i < positions.length; i++) {
	var imageSize = new kakao.maps.Size(64, 69);
	var markerImage = new kakao.maps.MarkerImage(positions[i].image, imageSize);
	var marker = new kakao.maps.Marker({
	  map: map, // 마커를 표시할 지도
	  position: positions[i].latlng, // 마커를 표시할 위치
	  title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	  image: markerImage, // 마커 이미지
	});
	}
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	map.panTo(positions[0].latlng);
}




//function makeMap(value, imageSrc, pageNo) {
//  if (value >= 9) value = parseInt(value) + 22;
//  var slideList = new Array();
//  var mapContainer = document.getElementById("map"), // 지도를 표시할 div
//    mapOption = {
//      center: new kakao.maps.LatLng(36.3890161659, 127.35127), // 지도의 중심좌표
//      level: 9, // 지도의 확대 레벨
//    };
//  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//  var positions = new Array();
//  fetch(
//    "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=tJN5AxShHg%2Bgz2XB9l7NRAfvFrPJalvdOfV2K9s3s8LiT2yAyfNb8LovR2QBepY6KYEpSq303TINwEKA9TdOmg%3D%3D&numOfRows=60&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&contentTypeId=39&areaCode=" +
//      value
//  )
//    .then((response) => response.json())
//    .then((data) => {
//      let items = data.response.body.items.item;
//
//  for (const item of items) {
//    const position = {
//      title: item.title,
//      latlng: new kakao.maps.LatLng(item.mapy, item.mapx), // 주의: 위도와 경도 순서가 바뀌었습니다.
//    };
//    positions.push(position);
//
//    const slide = {
//      title: item.title,
//      addr: item.addr1,
//      image: item.firstimage
//    };
//    slideList.push(slide);
//    
//  }
//  movePhoto(slideList);
//  
//  for (var i = 0; i < positions.length; i++) {
//    var imageSize = new kakao.maps.Size(64, 69);
//    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
//    var marker = new kakao.maps.Marker({
//      map: map, // 마커를 표시할 지도
//      position: positions[i].latlng, // 마커를 표시할 위치
//      title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//      image: markerImage, // 마커 이미지
//    });
//  }
//  var mapTypeControl = new kakao.maps.MapTypeControl();
//  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//  var zoomControl = new kakao.maps.ZoomControl();
//  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
//  map.panTo(positions[0].latlng);
//    });
//  
//}

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
      title.innerHTML = `<h3>${slideList[i].title}</h3>`;

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


