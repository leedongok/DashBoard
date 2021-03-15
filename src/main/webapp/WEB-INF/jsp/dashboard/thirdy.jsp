<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- Toast Grid -->
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-pagination/dist/tui-pagination.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.css" />


<div class="right_col" role="main" style="background-color: #5c5c5c38;">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12" style="position: relative; z-index: 0;">
			<div class="x_panel" style="background-color: #2f2e2e; border-color: #000000;">
				<div class="x_title">
					<h2 style="color: #c3f400">
						<strong>이벤트 관리</strong>
					</h2>
					<div class="clearfix"></div>
				</div>

				<div class="x_content">
					<!-- 그리드임 -->
					<div id="thirdEventSearch"></div>
					<!-- 그리드 밑의 입력창 -->
					<div class="profile_title" style="background-color: #444853;">
						 <div class='input-group date pull-right' id='myDatepicker9'>
								<label class="col-form-label col-md-3 col-sm-3  label-align" >기간조회<span class="required">:</span></label>
                                   <div class="col-md-6 col-sm-6">
                                        <input class="form-control" class='date' type="date" id="pickDate" name="date" required='required'>
                                        <input class="form-control" class='date' type="date" id="pickDate1" name="date" required='required'>
                                    </div>
                               </div>
						<div class="col-md-2">
							<span class="spanBTitle" style="color: white;">구분값 :</span> 
								<select id="eventCode" class="form-control" style="color: #000;" required>
									<option value="">- 선택 -</option>
									<option value="data1">1번선택</option>
									<option value="data2">2번선택</option>
									<option value="data3">3번선택</option>
									<option value="data4">3번선택</option>
							</select>
						</div>
					
						<button type="button" class="btn btn-default btn-sm" id="eventListSearch">조회</button>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="row marginB5">
							<h2 class=" col-md-4 spanBTitle"><strong>이벤트 처리등록</strong></h2>
					</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel" style="background-color: #2f2e2e;">
							<!-- 나중에 실제 서비스때 id바꿔센 명칭 -->
							<form class="" action="" method="post" novalidate>
									<div class="field item form-group" style="padding:10px;">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align" >1번입력값<span class="required">:</span></label>
                                       <div class="col-md-7 col-sm-7">
                                           <input class="form-control" id="first" type="text" class='text' name="text"  required='required'></div>
                                   </div>
                                   <div class="clearfix"></div>
                                   <div class="field item form-group" style="padding:10px;">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align">2번입력값<span class="required">:</span></label>
                                       <div class="col-md-7 col-sm-7">
                                           <input class="form-control" id="second" type="text" class='text' name="text"  required='required'></div>
                                   </div>
                                   <div class="clearfix"></div>
                                   <div class="field item form-group" style="padding:10px;">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align">날짜입력<span class="required">:</span></label>
                                       <div class="col-md-7 col-sm-7">
                                            <input class="form-control" id="third"  class='date' type="date" name="date" required='required'></div>
                                   </div>
                                   <div class="clearfix"></div>
                                   <div class="field item form-group" style="padding:10px;">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align">4번입력값<span class="required">:</span></label>
                                       <div class="col-md-7 col-sm-7">
                                           <input class="form-control" id="fourth"  type="text" class='text' name="text"  required='required'></div>
                                   </div>
                                   <div class="clearfix"></div>
                                   <div class="field item form-group" style="padding:10px;">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align">5번입력값<span class="required">:</span></label>
                                       <div class="col-md-7 col-sm-7">
                                           <input class="form-control" id="fiveth" type="text" class='text' name="text"  required='required'></div>
                                   </div>
                                   <div class="clearfix"></div>
                                   <div class="field item form-group" style="padding:10px;">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align">선택입력<span class="required">:</span></label>
                                       <div class="col-md-7 col-sm-7">
                                           <select id="causeCode"  class="form-control" style="color: #000;" required>
												<option value="">- 선택 -</option>
												<option value="data1">1번선택</option>
												<option value="data2">2번선택</option>
												<option value="data3">3번선택</option>
												<option value="data4">3번선택</option>
											</select>
                                   </div>
                                   <div class="clearfix"></div>
                                   <div class="field item form-group" style="padding:10px;">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align">파일업로드<span class="required">:</span></label>
                                       <div class="col-md-7 col-sm-7">
                                           <input type="file" id="fileUpload" name="file" onchange="changeValue(this)" />
                                   </div>
								</div>
							</div>
						</form>
					</div>
							<div class="modal-footer">
								<button type="button" id="issueChkBtn" class="btn btn-primary">등록</button>
							</div>
			</div>
		</div>
	</div>
</div>

<!-- tui-grid -->
<script src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>

<script type="text/javascript">
	var Now = new Date();
	var NowTime = Now.getFullYear();
	NowTime += '.' + (Now.getMonth() + 1);
	NowTime += '.' + Now.getDate();

	$('#pickDate').val(NowTime);
	$('#pickDate1').val(NowTime);
</script>

<!-- 조회 -->
<script type="text/javascript">
	$(document).on("click", "#eventListSearch", function() {
		//1. 날짜 정보 
		alert($('#pickDate1').val()); //이게앞
		alert($('#pickDate').val()); //이게뒤에
		//2. select 박스정보
		alert($('#eventCode').val()); //들어옴 조건걸면됨

		$.ajax({
			type : 'POST',
			url : '/eventSearch',
			dataType : "json",
			success : function(result) {
				grid1.setData(result.data);
			},
			error : function(data) {
				alert('error 관리자에게문의하시오.');
			}
		});
	});
</script>

<script type="text/javascript">
	$(document).on("click", "#issueChkBtn", function() {
		//앞단 데이터 캐치 완료 ajax처리해서 백단넘겨
		alert($('#first').val()); 
		alert($('#second').val());
		alert($('#third').val());
		alert($('#fourth').val());
		alert($('#fiveth').val());
		alert($('#causeCode').val());
		alert($('#fileUpload').val());

	});
</script>

<script type="text/javascript">
	const grid1 = new tui.Grid({
		el : document.getElementById('thirdEventSearch'),
		data : {
			api : {
				readData : {
					url : '/thirdEventList',
					method : 'POST'
				}
			}
		},
		scrollX : true,
		bodyHeight : 350,
		rowHeaders : [ 'rowNum' ],
		rowHeight : 30,
		columnOptions : {
			width : 100
		},
		columns : [ {
			header : '상태',
			name : 'status',
			sortable : true
		}, {
			header : '클라이언트',
			name : 'client',
			sortable : true
		}, {
			header : '이벤트',
			name : 'evt_content',
			sortable : true
		}, {
			header : '발생일시',
			name : 'occur_dt',
			sortable : true
		}, {
			header : '확인일시',
			name : 'chk_dt',
			sortable : true
		}, {
			header : '복구일시',
			name : 'restore_dt',
			sortable : true
		} ],
	    //컬럼 사이즈 수동조절 기능
	      columnOptions: {
	        resizable: true
	      }
	});

	//그리드 헤더버튼-> 사이드바 사이즈 축소 때 그리드 깨지는 현상 리프레시 기능
	$(document).on('click', '#menu_toggle', function() {
		grid1.refreshLayout();
	});
</script>

<script>
	//파일 업로드 시 파일전용 고유 유니크값 guid생성
	function guid() {
		function s4() {
			return Math.floor((1 + Math.random()) * 0x10000).toString(16)
					.substring(1);
		}
		return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4()
				+ s4() + s4();
	}

	//파일 업로드 시 확장자, 파일맥스사이즈 제어 및 저장
	function getCmaFileView() {
		if ($("#file_upload_field").val() != "") {
			var ext = $('#file_upload_field').val().split('.').pop()
					.toLowerCase();
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {

				Swal.fire({
					type : 'error',
					title : 'gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.',
				})
				$("#file_upload_field").val("");
				return;
			}
		}
		//파일용량 체크 프로세스
		if (document.getElementById("file_upload_field").value != "") {
			var fileSize = document.getElementById("file_upload_field").files[0].size;
			var maxSize = 5 * 1024 * 1024; //5mb로 제한 업로드

			if (fileSize > maxSize) {
				Swal.fire({
					type : 'error',
					title : '첨부파일 사이즈는 5MB 이내로 등록 가능합니다.',
				})
				$("#file_upload_field").val("");
				return;
			}
		}
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
		selection : {
			background : '#4daaf9',
			border : '#004082'
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
