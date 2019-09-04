
var mapContainer = document.getElementById('map-basic'); // 지도를 담을 영역의 DOM
															// 레퍼런스
var mapOptions = { // 지도를 생성할 때 필요한 기본 옵션
	center : new daum.maps.LatLng(37.566826005485716, 126.9786567859313), // 지도의
																			// 중심좌표.[위도(latitude),
																			// 경도(longitude)]
	level : 9, // 지도의 레벨(확대, 축소 정도)
	mapTypeId : daum.maps.MapTypeId.ROADMAP
// 지도종류
};

// 지도 생성
var map = new daum.maps.Map(mapContainer, mapOptions);

// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new daum.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(
				'서울시 강남구',
				function(result, status) {

					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {
						var coords = new daum.maps.LatLng(result[0].y,
								result[0].x);// 마커의 좌표

						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new daum.maps.Marker({
							map : map,
							position : coords
						});

						// 인포윈도우로 장소에 대한 설명을 표시
						var infowindow = new daum.maps.InfoWindow(
								{
									content : '<div style="width:150px;text-align:center;padding:6px 0;">서울시 강남구임</div>'
								});

						// 인포윈도우를 지도에 표시한다
						infowindow.open(map, marker);

						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
					}
				});
