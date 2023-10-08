var cnt = new Array();
cnt[0] = new Array("전체");
cnt[1] = new Array(
  "전체",
  "강남구",
  "강동구",
  "강북구",
  "강서구",
  "관악구",
  "광진구",
  "구로구",
  "금천구",
  "노원구",
  "도봉구",
  "동대문구",
  "동작구",
  "마포구",
  "서대문구",
  "서초구",
  "성동구",
  "성북구",
  "송파구",
  "양천구",
  "영등포구",
  "용산구",
  "은평구",
  "종로구",
  "중구",
  "중랑구"
);
cnt[2] = new Array(
  "전체",
  "강화군",
  "계양구",
  "미추홀구",
  "남동구",
  "동구",
  "부평구",
  "서구",
  "연수구",
  "옹진군",
  "중구"
);
cnt[3] = new Array("전체", "대덕구", "동구", "서구", "유성구", "중구");
cnt[4] = new Array("전체", "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구");
cnt[5] = new Array("전체", "광산구", "남구", "동구", "북구", "서구");
cnt[6] = new Array(
  "전체",
  "강서구",
  "금정구",
  "기장군",
  "남구",
  "동구",
  "동래구",
  "부산진구",
  "북구",
  "사상구",
  "사하구",
  "서구",
  "수영구",
  "연제구",
  "영도구",
  "중구",
  "해운대구"
);
cnt[7] = new Array("전체", "중구", "남구", "동구", "북구", "울주군");
cnt[8] = new Array("전체");
cnt[9] = new Array(
  "전체",
  "가평군",
  "고양시",
  "과천시",
  "광명시",
  "광주시",
  "구리시",
  "군포시",
  "김포시",
  "남양주시",
  "동두천시",
  "부천시",
  "성남시",
  "수원시",
  "시흥시",
  "안산시",
  "안성시",
  "안양시",
  "양주시",
  "양평군",
  "여주시",
  "연천군",
  "오산시",
  "용인시",
  "의왕시",
  "의정부시",
  "이천시",
  "파주시",
  "평택시",
  "포천시",
  "하남시",
  "화성시"
);
cnt[10] = new Array(
  "전체",
  "강릉시",
  "고성군",
  "동해시",
  "삼척시",
  "속초시",
  "양구군",
  "양양군",
  "영월군",
  "원주시",
  "인제군",
  "정선군",
  "철원군",
  "춘천시",
  "태백시",
  "평창군",
  "홍천군",
  "화천군",
  "횡성군"
);
cnt[11] = new Array(
  "전체",
  "괴산군",
  "단양군",
  "보은군",
  "영동군",
  "옥천군",
  "음성군",
  "제천시",
  "진천군",
  "null",
  "청주시",
  "충주시",
  "증평군"
);
cnt[12] = new Array(
  "전체",
  "공주시",
  "금산군",
  "논산시",
  "당진시",
  "보령시",
  "부여군",
  "서산시",
  "서천군",
  "아산시",
  "null",
  "예산군",
  "천안시",
  "청양군",
  "태안군",
  "홍성군",
  "계룡시"
);
cnt[13] = new Array(
  "전체",
  "경산시",
  "경주시",
  "고령군",
  "구미시",
  "고위군",
  "김천시",
  "문경시",
  "붕화군",
  "상주시",
  "성주군",
  "안동시",
  "영덕군",
  "영양군",
  "영주시",
  "영천시",
  "예천군",
  "울릉군",
  "울진군",
  "의성군",
  "청도군",
  "청송군",
  "칠곡군",
  "포항시"
);
cnt[14] = new Array(
  "전체",
  "거제시",
  "거창군",
  "고성군",
  "김해시",
  "남해군",
  "null",
  "밀양시",
  "사천시",
  "산청군",
  "양산시",
  "null",
  "의령군",
  "진주시",
  "null",
  "창녕군",
  "창원시",
  "통영시",
  "하동군",
  "함안군",
  "함양군",
  "합천군"
);
cnt[15] = new Array(
  "전체",
  "고창시",
  "군산시",
  "김제시",
  "남원시",
  "무주군",
  "부안군",
  "순창군",
  "완주군",
  "익산시",
  "임실군",
  "장수군",
  "전주시",
  "정읍시",
  "진안군"
);
cnt[16] = new Array(
  "전체",
  "강진군",
  "고흥군",
  "곡성군",
  "광양시",
  "구례군",
  "나주시",
  "담양군",
  "목표시",
  "무안군",
  "보성군",
  "순천시",
  "신안군",
  "여수시",
  "null",
  "null",
  "영광군",
  "영암군",
  "완도군",
  "장성군",
  "장흥군",
  "진도군",
  "함평군",
  "해남군",
  "화순군"
  );
  cnt[17] = new Array("전체", "null", "null","서귀포시", "제주시");
  
  const city = [
	  "서울",
	  "인천",
	  "대전",
	  "대구",
	  "광주",
	  "부산",
	  "울산",
	  "세종",
	  "경기",
	  "강원",
	  "충북",
	  "충남",
	  "경북",
	  "경남",
	  "전북",
	  "전남",
	  "제주",
	  ];
  
  let areaId = 0;

  document.addEventListener("DOMContentLoaded", function() {
	  
	  for (let i = 0; i < city.length; i++) {
		  let optionObj = document.createElement("option");
		  optionObj.value = i + 1;
		  optionObj.innerText = city[i];
		  document.getElementById("city").appendChild(optionObj);
		}
});
  document.getElementById('district').addEventListener("change", function(event) {
	  var cityCode = document.getElementById('city').value;
	  var districtCode = document.getElementById('district').value;
	  let url = "food?action=list&city=" + cityCode + "&district=" + districtCode; //임의로
	  fetch(url)
	  .then((response) => response.json())
	  .then((items) => {
		  makeMap(items, "")
	  });
  });
  
  document.getElementById('city').addEventListener('change', function(event) {
	  let cityCode = document.getElementById('city').value;
	  document.getElementById('district').options.length = 1;
	  for (let i = 0; i < cnt[cityCode].length; i++) {
		  if(cnt[cityCode][i] != "null") {
			  let optionObj = document.createElement('option');
			  optionObj.value = i ;
			  optionObj.innerText = cnt[cityCode][i];
			  document.getElementById("district").appendChild(optionObj);
		  }
	  }
  })