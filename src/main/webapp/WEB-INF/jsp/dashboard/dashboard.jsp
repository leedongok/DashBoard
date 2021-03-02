<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><!-- 커스텀태그 추가 -->
 <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7a76e79ab87a57d130a18e68d8e2d92"></script>

<style>
/* body {  color: #fff; }  */
#chartdiv {
  width: 100%;
  height: 500px;
}

#chartdiv2 {
  width: 100%;
  height: 400px;
  }
</style>

<div class="right_col" role="main"  style="background-color:#5c5c5c38;" >
	<div class="row">
	<!-- 상단 집계S -->
	<div class="col-md-12 col-sm-12 col-xs-12" style="position: relative; z-index: 0;">
		<div class="x_panel" style="background-color:#2f2e2e;">
			<div class="row tile_count">
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-user"></i> 전체 회원 수</span>
					<div class="count" style="text-align:center;">${totalUser}</div>
					<span class="count_bottom"><i class="green">4% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-clock-o"></i> 평균
						사용시간</span>
					<div class="count" style="text-align:center;">123.50</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>3% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-male"></i> 남성 비율</span>
					<div class="count" style="text-align:center;">${countMale}</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-female"></i> 여성 비율</span>
					<div class="count" style="text-align:center;">${countFemale}</div>
					<span class="count_bottom"><i class="red"><i
							class="fa fa-sort-desc"></i>12% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-download"></i> 리스트
						집계 데이터</span>
					<div class="count" style="text-align:center;">${listDataCount}</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-line-chart"></i>오늘
						접속자 수</span>
					<div class="count" style="text-align:center;">7,325</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 집계 E-->
	

	<br />
	<!-- CPU 측정 S -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e;">
				<div class="x_title">
					<h2 style="color:#c3f400;">PC상태 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="count" style="text-align:center;"></div>
				
				<div class="x_content">
				
					<p>CPU 점유율</p>
					
					<div id="chartdiv" style="height: 305px;"></div>
					<!-- <div id="echart_gauge" style="height: 305px;"></div> -->
				</div>
			</div>
		</div>
		<!-- CPU 측정 E -->

		<!-- 일정표 S -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e;">
				<div class="x_title">
					<h2 style="color:#c3f400;">
						오늘의 할일<small>일정표 스케쥴 링크연동 예정</small>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<c:forEach items="${scheduleList}" var="list">
						<article class="media event">
							<a class="pull-left date">
								<p class="month">${list.mon}
								<p class="day">${list.day2}</p>
							</a>
							<div class="media-body">
								<a class="title" href="#">${list.title}</a>
								<p>${list.content1}</p>
							</div>
						</article>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 일정표 E -->

		<!-- 날짜 UI S -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e;">
				<div class="x_title">
					<h2 style="color:#c3f400;">
						오늘의 날씨정보<small>날씨API(skp,구글 등)대체방안찾기</small>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="row">
						<div class="col-sm-11">
							<div class="temperature">
								<b>Monday</b>, 07:30 AM <span>F</span> <span><b>C</b></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<div class="weather-icon">
								<canvas height="84" width="84" id="partly-cloudy-day"></canvas>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="weather-text">
								<h2>
									서울 날씨 <br> <i>Partly Cloudy Day</i>
								</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="weather-text pull-right">
							<h3 class="degrees">23</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row weather-days">
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Mon</h2>
								<h3 class="degrees">25</h3>
								<canvas id="clear-day" width="32" height="32"></canvas>
								<h5>
									15 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Tue</h2>
								<h3 class="degrees">25</h3>
								<canvas height="32" width="32" id="rain"></canvas>
								<h5>
									12 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Wed</h2>
								<h3 class="degrees">27</h3>
								<canvas height="32" width="32" id="snow"></canvas>
								<h5>
									14 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Thu</h2>
								<h3 class="degrees">28</h3>
								<canvas height="32" width="32" id="sleet"></canvas>
								<h5>
									15 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Fri</h2>
								<h3 class="degrees">28</h3>
								<canvas height="32" width="32" id="wind"></canvas>
								<h5>
									11 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Sat</h2>
								<h3 class="degrees">26</h3>
								<canvas height="32" width="32" id="cloudy"></canvas>
								<h5>
									10 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 날짜 UI E -->
	
		<!-- amcharts S -->
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e;">
				<div class="x_title">
					<h2 style="color:#c3f400;">메모리 점유 현황</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div id="chartdiv2"></div>
					<!-- <div id="echart_line" style="height: 350px;"></div> -->
				</div>
			</div>
		</div>
	</div>
	<!-- e차트 E -->
	
	<!-- 지도 API S -->
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e;">
				<div class="x_title">
					<h2 style="color:#c3f400;">대한민국 지도 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-5">
						<input type="checkbox" id="chkTraffic"
							onclick="setOverlayMapTypeId()" /> 실시간 교통정보 <input
							type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" />
						자전거 도로 정보
					</div>
					<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>

				</div>
			</div>
		</div>
		</div>
	<!-- 지도 API E -->
	</div>



	<script src="../static/vendors/amcharts4/core.js"></script>
	<script src="../static/vendors/amcharts4/charts.js"></script>
	<script src="../static/vendors/amcharts4/maps.js"></script>
	<script src="../static/vendors/amcharts4/themes/dark.js"></script>
	<script src="../static/vendors/amcharts4/themes/animated.js"></script>
<!-- 차트게이지 -->

<script type="text/javascript">
/* $(document).ready(function(){
	multiChart(); //멀티차트 
}); */
</script>

<!-- Chart code -->
<script type="text/javascript">
am4core.ready(function() {

// Themes begin 컬러 및 애니메이션 효과 
am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
// Themes end

// create chart
var chart = am4core.create("chartdiv", am4charts.GaugeChart);
chart.innerRadius = am4core.percent(82);

chart.startAngle = -140;
chart.endAngle = 100;

/**
 * Normal axis
 */
var axis = chart.xAxes.push(new am4charts.ValueAxis());
axis.min = 0;
axis.max = 100;
axis.strictMinMax = true;
axis.renderer.radius = am4core.percent(80);
axis.renderer.inside = true;
axis.renderer.line.strokeOpacity = 1;
axis.renderer.ticks.template.disabled = false
axis.renderer.ticks.template.strokeOpacity = 1;
axis.renderer.ticks.template.length = 10;
axis.renderer.grid.template.disabled = true;
axis.renderer.labels.template.radius = 40;
axis.renderer.labels.template.adapter.add("text", function(text) {
  return text + "%";
})

/**
 * Axis for ranges
 */

var colorSet = new am4core.ColorSet();

var axis2 = chart.xAxes.push(new am4charts.ValueAxis());
//게이지 최소값
axis2.min = 0;
//게이지 최대값
axis2.max = 100;
//부채살 구분선

//각도 
axis2.renderer.innerRadius = 10
axis2.strictMinMax = true;
axis2.renderer.labels.template.disabled = true;
axis2.renderer.ticks.template.disabled = true;
axis2.renderer.grid.template.disabled = true;

//실데이터 값 
var range0 = axis2.axisRanges.create();
range0.value = 0;
range0.endValue = 50;
range0.axisFill.fillOpacity = 1;
range0.axisFill.fill = colorSet.getIndex(0);
//반대방향 채색효과
var range1 = axis2.axisRanges.create();
range1.value = 50;
range1.endValue = 100;
range1.axisFill.fillOpacity = 1;
range1.axisFill.fill = colorSet.getIndex(2);

/**
 * Label
 */
//게이지 내부의 폰트크기 및 초기 세팅 설정이 가능
var label = chart.radarContainer.createChild(am4core.Label);
label.isMeasured = false;
label.fontSize = 30;
label.x = am4core.percent(50);
label.y = am4core.percent(100);
label.horizontalCenter = "middle";
label.verticalCenter = "middle";
label.text = "0%";


/**
 * Hand
 */
//핸드는 게이지의 바늘을 뜻함. 다수의 바늘을 소환가능
var hand = chart.hands.push(new am4charts.ClockHand());
hand.axis = axis2;
//핀이 길이 퍼센티지
hand.innerRadius = am4core.percent(40);
hand.startWidth = 5;
//중앙에 고정핀 표출유무
hand.pin.disabled = true;
//핀이 가르킬 시작값.
hand.value = 0;

//인터벌 주는 데이터 연계처리하는 프로퍼티 체인지 정보
hand.events.on("propertychanged", function(ev) {
  //양수
  range0.endValue = ev.target.value;
  //음수
  range1.value = ev.target.value;
  //실데이터
  axis2.invalidate();
});



		setInterval(function() {
		    var value ;
			$.ajax({
				cache : false,
				url : '/myChart',
				success : function(data) {
					//실제 여기에 데이터가 인입되는 결과에따라 게이지가 바뀜.
					value =  Math.round(data.replace('%',""));
				  	//중앙라벨의 표시
					label.text = value + "%";
					  var animation = new am4core.Animation(hand, {
					    property: "value",
					    to: value
				  }, 1000, am4core.ease.cubicOut).start();
				}
			});
		}, 20000);

}); // end am4core.ready()
</script>

<!-- 멀티 라인 차트 -->
<script type="text/javascript">
am4core.ready(function() {

	// amcharts 테마 및 애니메이션 설정
	am4core.useTheme(am4themes_dark);
	am4core.useTheme(am4themes_animated);
	
	//멀티 라인 차트 선언
	var chart = am4core.create("chartdiv2", am4charts.XYChart);

	// Increase contrast by taking evey second color
	chart.colors.step = 2;
	// ajax 멀티차트 json값 //이건 amcharts4 버전업해야됨
	chart.dataSource.url = "/multiChart2";
	// Add data
	//chart.data = generateChartData();

	// Create axes
	var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
	dateAxis.renderer.minGridDistance = 50;

	// Create series
	function createAxisAndSeries(field, name, opposite, bullet) {
	  var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	  
	  var series = chart.series.push(new am4charts.LineSeries());
	  series.dataFields.valueY = field;
	  series.dataFields.dateX = "date";
	  series.strokeWidth = 2;
	  series.yAxis = valueAxis;
	  series.name = name;
	  series.tooltipText = "{name}: [bold]{valueY}[/]";
	  //라인의 곡선표현
	  series.tensionX = 1;
	  
	  var interfaceColors = new am4core.InterfaceColorSet();
	  
	  switch(bullet) {
	    case "triangle":
	      var bullet = series.bullets.push(new am4charts.Bullet());
	      bullet.width = 12;
	      bullet.height = 12;
	      bullet.horizontalCenter = "middle";
	      bullet.verticalCenter = "middle";
	      
	      var triangle = bullet.createChild(am4core.Triangle);
	      triangle.stroke = interfaceColors.getFor("background");
	      triangle.strokeWidth = 2;
	      triangle.direction = "top";
	      triangle.width = 12;
	      triangle.height = 12;
	      break;
	    case "rectangle":
	      var bullet = series.bullets.push(new am4charts.Bullet());
	      bullet.width = 10;
	      bullet.height = 10;
	      bullet.horizontalCenter = "middle";
	      bullet.verticalCenter = "middle";
	      
	      var rectangle = bullet.createChild(am4core.Rectangle);
	      rectangle.stroke = interfaceColors.getFor("background");
	      rectangle.strokeWidth = 2;
	      rectangle.width = 10;
	      rectangle.height = 10;
	      break;
	    default:
	      var bullet = series.bullets.push(new am4charts.CircleBullet());
	      bullet.circle.stroke = interfaceColors.getFor("background");
	      bullet.circle.strokeWidth = 2;
	      break;
	  }
	  
	  valueAxis.renderer.line.strokeOpacity = 1;
	  valueAxis.renderer.line.strokeWidth = 2;
	  valueAxis.renderer.line.stroke = series.stroke;
	  valueAxis.renderer.labels.template.fill = series.stroke;
	  valueAxis.renderer.opposite = opposite;
	  valueAxis.renderer.grid.template.disabled = true;
	}
	//명칭과 도형 표기
	createAxisAndSeries("total", "Total", false, "circle");
	createAxisAndSeries("free", "Free", true, "triangle");
	createAxisAndSeries("used", "Used", true, "rectangle");

	// Add legend
	chart.legend = new am4charts.Legend();

	// Add cursor
	chart.cursor = new am4charts.XYCursor();

	// generate some random data, quite different range
	/* function generateChartData() {
	  var chartData = [];
	  var firstDate = new Date();
	  firstDate.setDate(firstDate.getDate() - 100);
	  firstDate.setHours(0, 0, 0, 0);
		//초기 데이터 값
	  var total = 0;
	  var free = 0;
	  var used = 0;
	  
	  //ajax 시작
	  $.ajax({
			type:'POST',
			url : '/multiChart2',
			dataType:"json",
		success : function(data) { //멀티라인 차트 화면상 표출 15개 제한이라서 DB에서 15개의 데이터만 우선적으로 가져올수 있도록처리함.
		    $.each(data, function(index, item){
		    	var newDate = new Date(firstDate);
		   		newDate.setDate(newDate.getDate()+index);//데이터 호출갯수증가치만큼 하루씩 증가토록 처리함
		    	total += item.total; //초기 값에 누적된 값을 순차적으로 찍어내는 구조임 차트 표현식 상 15개가 맥시멈이여서 15개의 데이터만 리밋으로 호출해옴
		    	used += item.used;
		    	free += item.free;
				 //데이터 매핑
		    	 chartData.push({
				      date: newDate, //날짜값 기준으로 차트 내 데이터가 찍힘
				      total: total,  //메모리(임시)값을 표출 누적방식표출
				      free: free,
				      used: used
			   		 });
				});
			}
		});
	  //ajax 끝
	  return chartData;
	} */
}); // end am4core.ready()
</script>

<!-- 멀티차트 데이터 호출 -->
<!-- <script type="text/javascript">
function multiChart() {
	$.ajax({
			cache : false,
			url : '/multiChart2',
		success : function(data) {
			//데이터 확인 
			//alert(JSON.stringify(data));
			total  //1번 x,y축 데이터
			used   //2번 x,y축 데이터
			free   //3번 x,y축 데이터
			
		}
	});
}
</script> -->

<!-- 지도 API 제어 명령어 -->
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(37.72176756698391, 126.75141594184569), //지도의 중심좌표.
		level : 11
	//지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	function panTo() {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(37.72176756698391,
				126.75141594184569);
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	}
	var mapTypes = {
		traffic : kakao.maps.MapTypeId.TRAFFIC,
		bicycle : kakao.maps.MapTypeId.BICYCLE
	};
	function setOverlayMapTypeId() {
		chkTraffic = document.getElementById('chkTraffic'),
				chkBicycle = document.getElementById('chkBicycle');
		// 지도 타입을 제거합니다
		for ( var type in mapTypes) {
			map.removeOverlayMapTypeId(mapTypes[type]);
		}
		// 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
		if (chkTraffic.checked) {
			map.addOverlayMapTypeId(mapTypes.traffic);
		}
		// 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
		if (chkBicycle.checked) {
			map.addOverlayMapTypeId(mapTypes.bicycle);
		}
	}
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>




<!-- 자동실행기능 -->
<script type="text/javascript">
var autoRefreshYn = "N"; //기준지역변수
function setAutoRefreshYn() {
    if (autoRefreshYn == "N") {
        if(!confirm("자동 새로고침 설정을 ON으로 변경하시겠습니까?")) {
            return;
        }
        
        autoRefreshYn = "Y";
        autoRefresh = setInterval(function() {
			alert("잘작동중임.");        	
            $('#targetSearch').trigger('click');
        }, 3000); // 5초 간격으로 리스트 검색
    } else {
        if(!confirm("자동 새로고침 설정을 OFF로 변경하시겠습니까?")) {
            return;
        }
        autoRefreshYn = "N";
        clearInterval(autoRefresh);
    }
}
</script>
