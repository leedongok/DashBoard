<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><!-- 커스텀태그 추가 -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    


<!--stock_chart Styles -->
<style>
#stock_chart {
  width: 100%;
  height: 500px;
}
</style>

<!--live_chart Styles -->
<style>
#live_chart {
  width: 100%;
  height: 500px;
}
</style>

<!-- Styles -->
<style>
body { background-color: #30303d; color: #fff; }
#rtime_bar_chart {
  width: 100%;
  height: 500px;
}
</style>


<!-- Toast Grid -->
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-pagination/dist/tui-pagination.css" />
 <!-- Datatables -->
 <link href="../static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<!-- 차트 스타일Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 400px;
}
</style>

    		<!-- 라인 그래프  -->
      		<div class="right_col" role="main" style="background-color:#5c5c5c38;" >
      		<div class="row">
              
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">차트 데이터</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					<div id="chartdiv"></div>
                  </div>
                </div>
              </div>
              
    		<!-- 그리드형 API S -->
    		  <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">그리드형 데이터 제어</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                   </div>
                  <div class="x_content">
          		<!-- 토스트 UI 호출 -->
         		<div id="grid"></div>
              		<div class="clearfix"></div>
              		  <div class="modal-footer">
		          		   <button type="button" class="btn btn-warning antosubmit" id = "addRow">로우추가</button>
		                   <button type="button" class="btn btn-warning antosubmit" id = "deleteRow">로우삭제</button>
		                   <button type="button" class="btn btn-primary antosubmit" id = "updateGrid">수정</button>
		                   <button type="button" class="btn btn-primary antosubmit" id ="deleteGrid">삭제</button>
	                   </div>
                  </div>
                  
                </div>
              </div>
				<!-- 그리드형 API E-->
				   <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">테이블형 데이터 제어</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content"> 
                 <table id="datatable-buttons" class="table table-bordered">
                      <thead>
                        <tr>
                          <th>순번</th>
                          <th>자재번호</th>
                          <th>브랜드명</th>
                          <th>상세내용</th>
                          <th>기타</th>
                        </tr>
                      </thead>
	                     <tbody>
							<c:forEach items="${list}" var="resultList">
								<tr>
									<th scope="row">${resultList.brand_name }</th>
									<th scope="row">${resultList.item_number }</th>
									<th scope="row">${resultList.season_reason }</th>
									<th scope="row">${resultList.status }</th>
									<th scope="row">${resultList.test }</th>
								</tr>
							</c:forEach>
						</tbody>
                    </table> 
                  </div>
                </div>
              </div>
            <!-- 파일업로드API S -->
            
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">파일 업로드 </h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p>다중 업로드를 위해 여러 파일을 아래 상자에 끌어다 놓거나 파일을 선택하려면 클릭하십시오. 또는 상자를 클릭해서 업로드 해주세요. </p>
                    <form action="form_upload.html" class="dropzone" style="color:#363636"></form>
                    <br />
                  </div>
                </div>
              </div>
            </div>
            <!-- 파일업로드API E -->
            
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel" style="background-color:#2f2e2e;">
							<div class="x_title">
								<h2>라이브 차트 샘플 1</h2>
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
								<div id="live_chart"></div>
			                  </div>
			                </div>
			              </div>
					</div>
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel" style="background-color:#2f2e2e;">
							<div class="x_title">
								<h2>라이브 차트 샘플 2</h2>
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
								<div id="stock_chart"></div>
			                  </div>
			                </div>
			              </div>
					</div>
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel" style="background-color:#2f2e2e;">
							<div class="x_title">
								<h2>라이브 차트 샘플 3</h2>
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
								<div id="rtime_bar_chart"></div>
			                  </div>
			                </div>
			              </div>
					</div>



            
          </div>
          
<script	src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>
<script src="../static/vendors/amcharts4/core.js"></script>
<script src="../static/vendors/amcharts4/charts.js"></script>
<script src="../static/vendors/amcharts4/maps.js"></script>
<script src="../static/vendors/amcharts4/themes/moonrisekingdom.js"></script>
<script src="../static/vendors/amcharts4/themes/animated.js"></script>
<!-- <script src="../static/vendors/amcharts4/lang/ko_KR.js"></script> -->
<!-- Datatables -->
<script src="../static/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../static/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../static/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../static/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../static/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../static/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="../static/vendors/jszip/dist/jszip.min.js"></script>
<script src="../static/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="../static/vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.XYChart);

chart.colors.step = 2;
chart.maskBullets = false;

// Add data
chart.data = [{
    "date": "2012-01-01",
    "distance": 227,
    "townName": "New York",
    "townName2": "New York",
    "townSize": 12,
    "latitude": 40.71,
    "duration": 408
}, {
    "date": "2012-01-02",
    "distance": 371,
    "townName": "Washington",
    "townSize": 7,
    "latitude": 38.89,
    "duration": 482
}, {
    "date": "2012-01-03",
    "distance": 433,
    "townName": "Wilmington",
    "townSize": 3,
    "latitude": 34.22,
    "duration": 562
}, {
    "date": "2012-01-04",
    "distance": 345,
    "townName": "Jacksonville",
    "townSize": 3.5,
    "latitude": 30.35,
    "duration": 379
}, {
    "date": "2012-01-05",
    "distance": 480,
    "townName": "Miami",
    "townName2": "Miami",
    "townSize": 5,
    "latitude": 25.83,
    "duration": 501
}, {
    "date": "2012-01-06",
    "distance": 386,
    "townName": "Tallahassee",
    "townSize": 3.5,
    "latitude": 30.46,
    "duration": 443
}, {
    "date": "2012-01-07",
    "distance": 348,
    "townName": "New Orleans",
    "townSize": 5,
    "latitude": 29.94,
    "duration": 405
}, {
    "date": "2012-01-08",
    "distance": 238,
    "townName": "Houston",
    "townName2": "Houston",
    "townSize": 8,
    "latitude": 29.76,
    "duration": 309
}, {
    "date": "2012-01-09",
    "distance": 218,
    "townName": "Dalas",
    "townSize": 8,
    "latitude": 32.8,
    "duration": 287
}, {
    "date": "2012-01-10",
    "distance": 349,
    "townName": "Oklahoma City",
    "townSize": 5,
    "latitude": 35.49,
    "duration": 485
}, {
    "date": "2012-01-11",
    "distance": 603,
    "townName": "Kansas City",
    "townSize": 5,
    "latitude": 39.1,
    "duration": 890
}, {
    "date": "2012-01-12",
    "distance": 534,
    "townName": "Denver",
    "townName2": "Denver",
    "townSize": 9,
    "latitude": 39.74,
    "duration": 810
}, {
    "date": "2012-01-13",
    "townName": "Salt Lake City",
    "townSize": 6,
    "distance": 425,
    "duration": 670,
    "latitude": 40.75,
    "dashLength": 8,
    "alpha": 0.4
}, {
    "date": "2012-01-14",
    "latitude": 36.1,
    "duration": 470,
    "townName": "Las Vegas",
    "townName2": "Las Vegas"
}]; 

// Create axes
//날짜 값 
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.grid.template.location = 0;
dateAxis.renderer.minGridDistance = 50;
dateAxis.renderer.grid.template.disabled = true;
dateAxis.renderer.fullWidthTooltip = true;

var distanceAxis = chart.yAxes.push(new am4charts.ValueAxis());
distanceAxis.title.text = "Distance";
distanceAxis.renderer.grid.template.disabled = true;

var durationAxis = chart.yAxes.push(new am4charts.DurationAxis());
durationAxis.title.text = "시간";
durationAxis.baseUnit = "minute";
durationAxis.renderer.grid.template.disabled = true;
durationAxis.renderer.opposite = true;

durationAxis.durationFormatter.durationFormat = "hh':'mm";

var latitudeAxis = chart.yAxes.push(new am4charts.ValueAxis());
latitudeAxis.renderer.grid.template.disabled = true;
latitudeAxis.renderer.labels.template.disabled = true;

// Create series
var distanceSeries = chart.series.push(new am4charts.ColumnSeries());
distanceSeries.dataFields.valueY = "distance";
distanceSeries.dataFields.dateX = "date";
distanceSeries.yAxis = distanceAxis;
distanceSeries.tooltipText = "{valueY} miles";
distanceSeries.name = "거리";
distanceSeries.columns.template.fillOpacity = 0.7;
distanceSeries.columns.template.propertyFields.strokeDasharray = "dashLength";
distanceSeries.columns.template.propertyFields.fillOpacity = "alpha";

var disatnceState = distanceSeries.columns.template.states.create("hover");
disatnceState.properties.fillOpacity = 0.9;

var durationSeries = chart.series.push(new am4charts.LineSeries());
durationSeries.dataFields.valueY = "duration";
durationSeries.dataFields.dateX = "date";
durationSeries.yAxis = durationAxis;
durationSeries.name = "Duration";
durationSeries.strokeWidth = 2;
durationSeries.propertyFields.strokeDasharray = "dashLength";
durationSeries.tooltipText = "{valueY.formatDuration()}";

var durationBullet = durationSeries.bullets.push(new am4charts.Bullet());
var durationRectangle = durationBullet.createChild(am4core.Rectangle);
durationBullet.horizontalCenter = "middle";
durationBullet.verticalCenter = "middle";
durationBullet.width = 7;
durationBullet.height = 7;
durationRectangle.width = 7;
durationRectangle.height = 7;

var durationState = durationBullet.states.create("hover");
durationState.properties.scale = 1.2;

var latitudeSeries = chart.series.push(new am4charts.LineSeries());
latitudeSeries.dataFields.valueY = "latitude";
latitudeSeries.dataFields.dateX = "date";
latitudeSeries.yAxis = latitudeAxis;
latitudeSeries.name = "Duration";
latitudeSeries.strokeWidth = 2;
latitudeSeries.propertyFields.strokeDasharray = "dashLength";
latitudeSeries.tooltipText = "Latitude: {valueY} ({townName})";

var latitudeBullet = latitudeSeries.bullets.push(new am4charts.CircleBullet());
latitudeBullet.circle.fill = am4core.color("#fff");
latitudeBullet.circle.strokeWidth = 2;
latitudeBullet.circle.propertyFields.radius = "townSize";

var latitudeState = latitudeBullet.states.create("hover");
latitudeState.properties.scale = 1.2;

var latitudeLabel = latitudeSeries.bullets.push(new am4charts.LabelBullet());
latitudeLabel.label.text = "{townName2}";
latitudeLabel.label.horizontalCenter = "left";
latitudeLabel.label.dx = 14;

// Add legend
chart.legend = new am4charts.Legend();

// Add cursor
chart.cursor = new am4charts.XYCursor();
chart.cursor.fullWidthLineX = true;
chart.cursor.xAxis = dateAxis;
chart.cursor.lineX.strokeOpacity = 0;
chart.cursor.lineX.fill = am4core.color("#000");
chart.cursor.lineX.fillOpacity = 0.1;

}); // end am4core.ready()
</script>



<script type="text/javascript">
	$(document).ready(function(){
		//selectBoardList();
	});
</script>




<script type="text/javascript">
		//자바스크립트 YYYY-MM-DD 오늘 날짜 구하기
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '.' + (Now.getMonth()+1);
		NowTime += '.' + Now.getDate();
</script>
<!-- 그리드 제어 명령어 -->
<script type="text/javascript">
const grid1 = new tui.Grid({
  el: document.getElementById('grid'),
   data: {
  	 	withCredentials: false,
	    initialRequest: true,
        api: {
           readData: { url: '/selectBoardList', method: 'POST'}
           //,createData: { url: '/api/create', method: 'POST' }
		   //,updateData: { url: '/api/update', method: 'PUT' }
		   //,deleteData: { url: '/api/delete', method: 'DELETE' }
		   //,modifyData: { url: '/api/modify', method: 'POST' }
        }
      },
    bodyHeight: 350,
    virtualScrolling :true,
    rowHeaders:['checkbox','rowNum'],
    rowHeight: 70,
  columns: [
    {
      header: '브랜드명',
      align: 'center',
      name: 'brand_name',
      sortingType: 'desc',
      sortable: true,
      editor: 'text'
    },
    {
      header: '모델번호',
      align: 'center',
      name: 'item_number',
      sortingType: 'desc',
      sortable: true,
       formatter: 'listItemText',
          editor: {
            type: 'select',
            options: {
              listItems: [
                { text: 'Deluxe', value: '1' },
                { text: 'EP', value: '2' },
                { text: 'Single', value: '3' }
              ]
            }
         }
    },
    {
      header: '시즌',
      align: 'center',
      name: 'season_reason',
      sortingType: 'desc',
          sortable: true
    },
    {
      header: '정보',
      align: 'center',
      name: 'status'
    },
     {
      header: '제레널',
      align: 'center',
      name: 'clob',
      sortingType: 'asc',
      sortable: true
    }
  ],
  	  columnOptions: {
  	    //frozenCount: 1, //칸 고정시키기
        //frozenBorderWidth: 2,
        resizable: true //컬럼 사이즈 수동조절 ON/OFF
      },
      //그리드 데이터 집계 정보
      summary: {
        height: 40,
        position: 'bottom',
        columnContent: {
          status: {
            template: function(valueMap) {
              return `MAX: ${valueMap.max}<br>MIN: ${valueMap.min}`;
            }
          },
          clob: {
            template: function(valueMap) {
              return `TOTAL: ${valueMap.sum} <br>AVG: ${valueMap.avg.toFixed(2)}`;
            }
          }
        }
      }
});

//로우추가버튼
$('#addRow').click(function() {
	grid1.appendRow();
});

//로우삭제버튼
$('#deleteRow').click(function() {
// 체크된 값만 삭제될 수 있도록 처리 실데이터가 지워지는게 아닌 추가한 로우삭제용도임.
	grid1.removeCheckedRows(true);
});


/* grid1.on('beforeRequest', function(data) {
console.log("요청보내기 전 처리");
  // 요청보내기 전 처리
}).on('response', function(data) {
	console.log("성공여부에 관계없이 응답받았을때 실행");
  // 성공여부에 관계없이 응답받았을때 실행
}).on('successResponse', function(data) {
	console.log("요청보내기 전 처리");
  // 결과가 성공일때
}).on('failResponse', function(data) {
	console.log("결과 실패일때 이쪽");
  // 결과 실패일때 이쪽
}).on('errorResponse', function(data) {
	console.log("오류발생시 예외처리");
  // 오류발생시 예외처리
}); */

//그리드 헤더버튼-> 사이드바 사이즈 축소 때 그리드 깨지는 현상 리프레시 기능
$(document).on('click','#menu_toggle',function() {
	grid1.refreshLayout();
});
</script>
	
		
		
		
	//버전업되면서 AJAX통신 더간소화됨	
/* function selectBoardList() {
	$.ajax({
			type:'POST',
			url : '/selectBoardList',
			dataType:"json",
			success : function(result){
				grid1.setData(result.data);
			},
			error: function(data){
			      alert('error 관리자에게문의하시오.');
		    }
		});
	}  */
		
		
		//그리드에서 지원하는 NET통신
		/*   grid1.use('Net',{
			perPage:500,
			readDataMethod: 'GET',
			api:{
				readData:'/selectBoardList',
				createdData : '/insertRows'
			}
		}); 
		 var net = grid1.getAddOn('Net');
		
		 
		// 후처리 로직 성공 실패 유무 
		grid1.on('response', function(data) {
			console.log("1",data);
		    
		}); */
		
		
		//동적 셀렉트박스 구성하기
		//1번셀렉트박스의 값을기반으로 조회하여 2번차수의 셀렉트박스에 결과 리스트를 호출하여 선택할수있게한다.
		/* $('#SearchStore').change(function(){
			$.ajax({
				type:'POST',
				url : '/storeDeviceInfo',
				data : {
					store_name : $('#SearchStore').val(),
					},
				dataType:"json",
				success:function(data){
					$.each(data, function(key, val) {
						//1번선택값에 의한 결과값을 2번셀렉트에 주입
						$('#storeDeviceInfo').append("<option value='"+val.device_nm+"'>"+val.device_nm+"</option>");
					});
				}
			});
		}); */


		//tui-grid 내에서 해당 셀클릭해서 팝업띄우는 액션을 호출하는 
		//해당미리보기 구현되면 팝업으로 상세보기 기능 예고
		/* 셀을 클릭할 때 팝업을 띄워주는 기능을 제공하고 있지는 않지만 제공되고 있는 
		focusChange이벤트를 이용해서 해당 rowKey와 columnName을 가져와서 팝업을 띄워주도록 
		하는 방식으로 개발이 될 수 있을 것 같습니다. */
		//grid1.on('focusChange', (ev) => {
			  //const{columnName, rowKey} = ev;
			  //클릭한셀의 정보 가져오기
			  //console.log(grid1.getRow(rowKey));
			  //img 의 src를 변경하는 방법
			  //$("#img_form_url").attr("src", imgurl);
			  //팝업창띄우기 가장마지막에
			 // $('#popupModalNew').modal('toggle');
			//});
		
		
		
		//이미지 프론트와 백로직둘다 체크
		//파일업로드 확장자, 파일크기 제한 유효성 체크
		function getCmaFileView() {
			//파일정보
			if( $("#file_upload_field").val() != "" ){
				var ext = $('#file_upload_field').val().split('.').pop().toLowerCase();
				      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
					 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
					 $("#file_upload_field").val("");
					 return;
				      }
				}
			//이미지 파일 사이즈
			if(document.getElementById("file_upload_field").value!=""){
			    var fileSize = document.getElementById("file_upload_field").files[0].size;
			    var maxSize = 5 * 1024 * 1024;//5MB
			 	 
			    if(fileSize > maxSize){
			       alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다. ");
			        $("#file_upload_field").val("");
			        return;
			     }
			} 
		}
		//자바스크립트 내 guid생성 이미지와 데이터 키값 매핑용으로 유니크 값 사용
		function guid() {
			  function s4() {
			    return Math.floor((1 + Math.random()) * 0x10000)
			      .toString(16)
			      .substring(1);
			  }
			  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
			    s4() + '-' + s4() + s4() + s4();
			}
</script>

  	<!-- 데이타 테이블 -->
		<script type="text/javascript"> 
		function dataTables() { 
		var myTable= echarts.init(document.getElementById("datatable-buttons"));
			myTable.setOption;
		
		$('#datatable-buttons').DataTable({
				"responsive" : false
			}); 
		}
		</script>

<!-- 그리드 툴 테마 설정 -->
  <script type="text/javascript">
  tui.Grid.applyTheme("default", {
		grid : {
			background : '#3a3a3a',
			border : '#000000',
			text : '#444'
		},
		setSelectionRange : {
			background : '#A4A4A4',
			border : '#004082'
		},
		toolbar : {
			border : '#000000',
			background : '#262930'
		},
		 selection: {
		    background: '#4daaf9',
		    border: '#004082'
		  },
		scrollbar : {
			background : '#262930',
			thumb : '#fff',
			emptySpace : '#262930',
			active : '#c1c1c1'
		},
		cell : {
			normal : {
				background : '#3a3a3a',
				border : '#000000',
				text : '#fff'
			},
			header : {
				background : '#262930',
				border : '#000000',
				text : '#4b96e6'
			},
			rowHeader : {
				background : '#262930',
				border : '#000000',
				text : '#fff'
			},
			summary : {
				background : '#262930',
				border : '#000000',
				text : '#fff'
			},
			editable : {
				background : '#3a3a3a',
				border : '#fff',
				text : '#fff'
			},
			selectedHeader : {
				background : '#616161'
			},
			selectedRowHeader : {
				background : '#616161'
			},
			focused : {
				border : '#FFBF00'
			},
			disabled : {
				background : '#3a3a3a',
				border : '#000000',
				text : '#fff'
			},
			currentRow : {
				background : '#0B243B'
			}
		}
	});
</script>

<!-- 그리드 삭제 이벤트 -->
 <script type="text/javascript">
	/* $("#deleteGrid").click(function() {
			 if(confirm("삭제 하시겠습니까?") == false) {
		         return false;
		     }
			if(grid1.getCheckedRowKeys(true) == "[]"){
				alert("체크박스를 선택하시오.");
				return false;
			}
				
			 
			 var test = grid1.getCheckedRows(true);
			 
			 $.ajax({
			        url:"/delGrid",
			        type:'POST',
			        data: {delParam:test},
			        dataType:'json',
			        success:function(data){
			        	if(data.code==1){
			        		 alert("삭제완료.");
			        	}else{
			        		
			        	}
			        },
			        error:function(data){
			        	alert("에러발생 관리자에게 문의하시오.");
			        }
			    });
		});  */
</script>


<!-- Resources -->
<!-- amcharts4 -->
<script src="../static/vendors/amcharts4/core.js"></script>
<script src="../static/vendors/amcharts4/charts.js"></script>
<script src="../static/vendors/amcharts4/themes/dark.js"></script>
<script src="../static/vendors/amcharts4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {
//차트테마설정 
am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
//차트연결-> html
var chart = am4core.create("stock_chart", am4charts.XYChart);
chart.paddingRight = 20;
//차트 데이터포맷 시분초되는지알아보기
chart.dateFormatter.inputDateFormat = "yyyy-MM-dd";
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.grid.template.location = 0;
var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.tooltip.disabled = true;
var series = chart.series.push(new am4charts.CandlestickSeries());
series.dataFields.dateX = "date";
series.dataFields.valueY = "close";
series.dataFields.openValueY = "open";
series.dataFields.lowValueY = "low";
series.dataFields.highValueY = "high";
series.simplifiedProcessing = true;
series.tooltipText = "Open:${openValueY.value}\nLow:${lowValueY.value}\nHigh:${highValueY.value}\nClose:${valueY.value}";
chart.cursor = new am4charts.XYCursor();
// a separate series for scrollbar
var lineSeries = chart.series.push(new am4charts.LineSeries());
lineSeries.dataFields.dateX = "date";
lineSeries.dataFields.valueY = "close";
// need to set on default state, as initially series is "show"
lineSeries.defaultState.properties.visible = false;
// hide from legend too (in case there is one)
lineSeries.hiddenInLegend = true;
lineSeries.fillOpacity = 0.5;
lineSeries.strokeOpacity = 0.5;
var scrollbarX = new am4charts.XYChartScrollbar();
scrollbarX.series.push(lineSeries);
chart.scrollbarX = scrollbarX;
chart.data = [ {
    "date": "2011-08-01",
    "open": "136.65",
    "high": "136.96",
    "low": "134.15",
    "close": "136.49"
  }, {
    "date": "2011-08-02",
    "open": "135.26",
    "high": "135.95",
    "low": "131.50",
    "close": "131.85"
  }, {
    "date": "2011-08-05",
    "open": "132.90",
    "high": "135.27",
    "low": "128.30",
    "close": "135.25"
  }, {
    "date": "2011-08-06",
    "open": "134.94",
    "high": "137.24",
    "low": "132.63",
    "close": "135.03"
  }, {
    "date": "2011-08-07",
    "open": "136.76",
    "high": "136.86",
    "low": "132.00",
    "close": "134.01"
  }, {
    "date": "2011-08-08",
    "open": "131.11",
    "high": "133.00",
    "low": "125.09",
    "close": "126.39"
  }, {
    "date": "2011-08-09",
    "open": "123.12",
    "high": "127.75",
    "low": "120.30",
    "close": "125.00"
  }, {
    "date": "2011-08-12",
    "open": "128.32",
    "high": "129.35",
    "low": "126.50",
    "close": "127.79"
  }, {
    "date": "2011-08-13",
    "open": "128.29",
    "high": "128.30",
    "low": "123.71",
    "close": "124.03"
  }, {
    "date": "2011-08-14",
    "open": "122.74",
    "high": "124.86",
    "low": "119.65",
    "close": "119.90"
  }, {
    "date": "2011-08-15",
    "open": "117.01",
    "high": "118.50",
    "low": "111.62",
    "close": "117.05"
  }, {
    "date": "2011-08-16",
    "open": "122.01",
    "high": "123.50",
    "low": "119.82",
    "close": "122.06"
  }, {
    "date": "2011-08-19",
    "open": "123.96",
    "high": "124.50",
    "low": "120.50",
    "close": "122.22"
  }, {
    "date": "2011-08-20",
    "open": "122.21",
    "high": "128.96",
    "low": "121.00",
    "close": "127.57"
  }, {
    "date": "2011-08-21",
    "open": "131.22",
    "high": "132.75",
    "low": "130.33",
    "close": "132.51"
  }, {
    "date": "2011-08-22",
    "open": "133.09",
    "high": "133.34",
    "low": "129.76",
    "close": "131.07"
  }, {
    "date": "2011-08-23",
    "open": "130.53",
    "high": "135.37",
    "low": "129.81",
    "close": "135.30"
  }, {
    "date": "2011-08-26",
    "open": "133.39",
    "high": "134.66",
    "low": "132.10",
    "close": "132.25"
  }, {
    "date": "2011-08-27",
    "open": "130.99",
    "high": "132.41",
    "low": "126.63",
    "close": "126.82"
  }, {
    "date": "2011-08-28",
    "open": "129.88",
    "high": "134.18",
    "low": "129.54",
    "close": "134.08"
  }, {
    "date": "2011-08-29",
    "open": "132.67",
    "high": "138.25",
    "low": "132.30",
    "close": "136.25"
  }, {
    "date": "2011-08-30",
    "open": "139.49",
    "high": "139.65",
    "low": "137.41",
    "close": "138.48"
  }, {
    "date": "2011-09-03",
    "open": "139.94",
    "high": "145.73",
    "low": "139.84",
    "close": "144.16"
  }, {
    "date": "2011-09-04",
    "open": "144.97",
    "high": "145.84",
    "low": "136.10",
    "close": "136.76"
  }, {
    "date": "2011-09-05",
    "open": "135.56",
    "high": "137.57",
    "low": "132.71",
    "close": "135.01"
  }, {
    "date": "2011-09-06",
    "open": "132.01",
    "high": "132.30",
    "low": "130.00",
    "close": "131.77"
  }, {
    "date": "2011-09-09",
    "open": "136.99",
    "high": "138.04",
    "low": "133.95",
    "close": "136.71"
  }, {
    "date": "2011-09-10",
    "open": "137.90",
    "high": "138.30",
    "low": "133.75",
    "close": "135.49"
  }, {
    "date": "2011-09-11",
    "open": "135.99",
    "high": "139.40",
    "low": "135.75",
    "close": "136.85"
  }, {
    "date": "2011-09-12",
    "open": "138.83",
    "high": "139.00",
    "low": "136.65",
    "close": "137.20"
  }, {
    "date": "2011-09-13",
    "open": "136.57",
    "high": "138.98",
    "low": "136.20",
    "close": "138.81"
  }, {
    "date": "2011-09-16",
    "open": "138.99",
    "high": "140.59",
    "low": "137.60",
    "close": "138.41"
  }, {
    "date": "2011-09-17",
    "open": "139.06",
    "high": "142.85",
    "low": "137.83",
    "close": "140.92"
  }, {
    "date": "2011-09-18",
    "open": "143.02",
    "high": "143.16",
    "low": "139.40",
    "close": "140.77"
  }, {
    "date": "2011-09-19",
    "open": "140.15",
    "high": "141.79",
    "low": "139.32",
    "close": "140.31"
  }, {
    "date": "2011-09-20",
    "open": "141.14",
    "high": "144.65",
    "low": "140.31",
    "close": "144.15"
  }, {
    "date": "2011-09-23",
    "open": "146.73",
    "high": "149.85",
    "low": "146.65",
    "close": "148.28"
  }, {
    "date": "2011-09-24",
    "open": "146.84",
    "high": "153.22",
    "low": "146.82",
    "close": "153.18"
  }, {
    "date": "2011-09-25",
    "open": "154.47",
    "high": "155.00",
    "low": "151.25",
    "close": "152.77"
  }, {
    "date": "2011-09-26",
    "open": "153.77",
    "high": "154.52",
    "low": "152.32",
    "close": "154.50"
  }, {
    "date": "2011-09-27",
    "open": "153.44",
    "high": "154.60",
    "low": "152.75",
    "close": "153.47"
  }, {
    "date": "2011-09-30",
    "open": "154.63",
    "high": "157.41",
    "low": "152.93",
    "close": "156.34"
  }, {
    "date": "2011-10-01",
    "open": "156.55",
    "high": "158.59",
    "low": "155.89",
    "close": "158.45"
  }, {
    "date": "2011-10-02",
    "open": "157.78",
    "high": "159.18",
    "low": "157.01",
    "close": "157.92"
  }, {
    "date": "2011-10-03",
    "open": "158.00",
    "high": "158.08",
    "low": "153.50",
    "close": "156.24"
  }, {
    "date": "2011-10-04",
    "open": "158.37",
    "high": "161.58",
    "low": "157.70",
    "close": "161.45"
  }, {
    "date": "2011-10-07",
    "open": "163.49",
    "high": "167.91",
    "low": "162.97",
    "close": "167.91"
  }, {
    "date": "2011-10-08",
    "open": "170.20",
    "high": "171.11",
    "low": "166.68",
    "close": "167.86"
  }, {
    "date": "2011-10-09",
    "open": "167.55",
    "high": "167.88",
    "low": "165.60",
    "close": "166.79"
  }, {
    "date": "2011-10-10",
    "open": "169.49",
    "high": "171.88",
    "low": "153.21",
    "close": "162.23"
  }, {
    "date": "2011-10-11",
    "open": "163.01",
    "high": "167.28",
    "low": "161.80",
    "close": "167.25"
  }, {
    "date": "2011-10-14",
    "open": "167.98",
    "high": "169.57",
    "low": "163.50",
    "close": "166.98"
  }, {
    "date": "2011-10-15",
    "open": "165.54",
    "high": "170.18",
    "low": "165.15",
    "close": "169.58"
  }, {
    "date": "2011-10-16",
    "open": "172.69",
    "high": "173.04",
    "low": "169.18",
    "close": "172.75"
  }];
}); // end am4core.ready()
</script>



<!-- Chart code -->
<script>
am4core.ready(function() {
// Themes begin
am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
// Themes end
var chart = am4core.create("live_chart", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0;
chart.padding(0, 0, 0, 0);
chart.zoomOutButton.disabled = true;
var data = [];
var visits = 10;
var i = 0;
for (i = 0; i <= 30; i++) {
    visits -= Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
    data.push({ date: new Date().setSeconds(i - 30), value: visits });
}
chart.data = data;
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.grid.template.location = 0;
dateAxis.renderer.minGridDistance = 30;
dateAxis.dateFormats.setKey("second", "ss");
dateAxis.periodChangeDateFormats.setKey("second", "[bold]h:mm a");
dateAxis.periodChangeDateFormats.setKey("minute", "[bold]h:mm a");
dateAxis.periodChangeDateFormats.setKey("hour", "[bold]h:mm a");
dateAxis.renderer.inside = true;
dateAxis.renderer.axisFills.template.disabled = true;
dateAxis.renderer.ticks.template.disabled = true;
var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.tooltip.disabled = true;
valueAxis.interpolationDuration = 500;
valueAxis.rangeChangeDuration = 500;
valueAxis.renderer.inside = true;
valueAxis.renderer.minLabelPosition = 0.05;
valueAxis.renderer.maxLabelPosition = 0.95;
valueAxis.renderer.axisFills.template.disabled = true;
valueAxis.renderer.ticks.template.disabled = true;
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.dateX = "date";
series.dataFields.valueY = "value";
series.interpolationDuration = 500;
series.defaultState.transitionDuration = 0;
series.tensionX = 0.8;
chart.events.on("datavalidated", function () {
    dateAxis.zoom({ start: 1 / 15, end: 1.2 }, false, true);
});
dateAxis.interpolationDuration = 500;
dateAxis.rangeChangeDuration = 500;
document.addEventListener("visibilitychange", function() {
    if (document.hidden) {
        if (interval) {
            clearInterval(interval);
        }
    }
    else {
        startInterval();
    }
}, false);
// add data
var interval;
function startInterval() {
    interval = setInterval(function() {
        visits =
            visits + Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 5);
        var lastdataItem = series.dataItems.getIndex(series.dataItems.length - 1);
        chart.addData(
            { date: new Date(lastdataItem.dateX.getTime() + 1000), value: visits },
            1
        );
    }, 1000);
}
startInterval();
// all the below is optional, makes some fancy effects
// gradient fill of the series
series.fillOpacity = 1;
var gradient = new am4core.LinearGradient();
gradient.addColor(chart.colors.getIndex(0), 0.2);
gradient.addColor(chart.colors.getIndex(0), 0);
series.fill = gradient;
// this makes date axis labels to fade out
dateAxis.renderer.labels.template.adapter.add("fillOpacity", function (fillOpacity, target) {
    var dataItem = target.dataItem;
    return dataItem.position;
})
// need to set this, otherwise fillOpacity is not changed and not set
dateAxis.events.on("validated", function () {
    am4core.iter.each(dateAxis.renderer.labels.iterator(), function (label) {
        label.fillOpacity = label.fillOpacity;
    })
})
// this makes date axis labels which are at equal minutes to be rotated
dateAxis.renderer.labels.template.adapter.add("rotation", function (rotation, target) {
    var dataItem = target.dataItem;
    if (dataItem.date && dataItem.date.getTime() == am4core.time.round(new Date(dataItem.date.getTime()), "minute").getTime()) {
        target.verticalCenter = "middle";
        target.horizontalCenter = "left";
        return -90;
    }
    else {
        target.verticalCenter = "bottom";
        target.horizontalCenter = "middle";
        return 0;
    }
})
// bullet at the front of the line
var bullet = series.createChild(am4charts.CircleBullet);
bullet.circle.radius = 5;
bullet.fillOpacity = 1;
bullet.fill = chart.colors.getIndex(0);
bullet.isMeasured = false;
series.events.on("validated", function() {
    bullet.moveTo(series.dataItems.last.point);
    bullet.validatePosition();
});
}); // end am4core.ready()
</script>

<!-- 3가지 유형의 데이터 처리 차트 핸들링해보기 -->




<!-- Chart code -->
<script>
am4core.ready(function() {
// Themes begin
am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
// Themes end
var chart = am4core.create("rtime_bar_chart", am4charts.XYChart);
chart.data = [{
 "country": "USA",
 "visits": 2025
}, {
 "country": "China",
 "visits": 1882
}, {
 "country": "Japan",
 "visits": 1809
}, {
 "country": "Germany",
 "visits": 1322
}, {
 "country": "UK",
 "visits": 1122
}, {
 "country": "France",
 "visits": 1114
}, {
 "country": "India",
 "visits": 984
}, {
 "country": "Spain",
 "visits": 711
}, {
 "country": "Netherlands",
 "visits": 665
}, {
 "country": "Russia",
 "visits": 580
}, {
 "country": "South Korea",
 "visits": 443
}, {
 "country": "Canada",
 "visits": 441
}];
chart.padding(40, 40, 40, 40);
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 60;
categoryAxis.renderer.inversed = false;//정렬 앞뒤 바꾸기
categoryAxis.renderer.grid.template.disabled = true;//false시 배경 줄모양 네모형태
var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.extraMax = 0.1;
//valueAxis.rangeChangeEasing = am4core.ease.linear;
//valueAxis.rangeChangeDuration = 1500;
var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "visits";
series.tooltipText = "{valueY.value}"
series.columns.template.strokeOpacity = 0;
series.columns.template.column.cornerRadiusTopRight = 10;
series.columns.template.column.cornerRadiusTopLeft = 10;
//series.interpolationDuration = 1500;
//series.interpolationEasing = am4core.ease.linear;
var labelBullet = series.bullets.push(new am4charts.LabelBullet());
labelBullet.label.verticalCenter = "bottom";
labelBullet.label.dy = -10;
labelBullet.label.text = "{values.valueY.workingValue.formatNumber('#.')}";
chart.zoomOutButton.disabled = true;
//기본적으로 동일한 계열의 열은 동일한 색상이므로 chart.colors 색상 세트에서 색상을 가져 오는 어댑터를 추가합니다.
series.columns.template.adapter.add("fill", function (fill, target) {
 return chart.colors.getIndex(target.dataItem.index);
});
setInterval(function () {
 am4core.array.each(chart.data, function (item) {
   item.visits += Math.round(Math.random() * 200 - 100);
   item.visits = Math.abs(item.visits);
 })
 chart.invalidateRawData();
}, 2000)
categoryAxis.sortBySeries = series;//이정렬기능때문에 amcharts4를 최신버전으로 업데이트 했음.
});
</script>

