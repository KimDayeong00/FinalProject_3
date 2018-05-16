<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- page content -->
 <script src="<c:url value="/resources/admin/vendors/jquery/dist/jquery.min.js" />"></script>
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>정산</h3>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							월별 수익 <small>라인그래프</small>
						</h2>

						<div class="clearfix"></div>
					</div>
					<select id="year">
						<option value="0">---</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
					</select> 년 <select id="month">
						<option value="0">---</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 월
					<div class="clearfix"></div>

					<div class="x_content" id="chartDiv1">
						<canvas id="chart_1" ></canvas>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panels">
					<div class="x_title">
						<h2>수익현황</h2>

					</div>
						<div class="clearfix"></div>
					<div class="x_content" id="chartDiv2">
						<canvas id="chart_2" width="500px;" height="300px;"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		
	</div>
</div>
<!-- page content -->



<script>
	$(document).ready(function() {

		var d_year = new Date().getFullYear();

		var d_month = new Date().getMonth() + 1;
		if (d_month < 10) {
			d_month = "0" + d_month;
		}

		$.ajax({
			url : "<c:url value='/admin/earn?year="+d_year+"&month="+d_month+"' />",
			dataType:"json",
			success : function(data) {
				
				//년 월
				var in_year = data.year;
				var in_month = data.month;
				
				
				
				//펫시터용 받는 부분
				var labelArray = new Array();
				var dataArray = new Array();
				var total = 0;//파이
				
				
				//쇼핑몰받는부분
				var labelArray_1 = new Array();
				var dataArray_1 = new Array();
				var total_1 = 0;//파이
				
				
				for (var i = 0; i < data.list.length; i++) {
					labelArray[i] = data.list[i].created_date;
					dataArray[i] = data.list[i].count;
					total +=data.list[i].count;
				}
				for (var i = 0; i < data.list2.length; i++) {
					labelArray_1[i] = data.list2[i].created_date;
					dataArray_1[i] = data.list2[i].count;
					total_1 +=data.list2[i].count;
				}
				
				
				/* 창 열었을 때 첫번째 차트에 월별 차트넣기 default 값은 현재 월의 차트 */
			 	new Chart(document.getElementById("chart_1"), {
					type : 'line',
					data : {
						labels : labelArray,
						datasets : [
								{
									label : "펫시터",
									data : dataArray,
									borderColor : "#3e95cd",
									fill : false
								},
								{
									label : "쇼핑몰",
									fill : false,
									data : dataArray_1,
									borderColor : "#8e5ea2"
								} ]
					},
					options : {
						responsive: true,
						title : {
							display : true,
							text : in_year+"년 "+in_month+"월 수익"
						}
					}
				}); 
				
				//파이차트
				new Chart(document.getElementById("chart_2"), {
					type : 'pie',
					data : {
						datasets : [ {
							data : [ total, total_1 ],
							backgroundColor : [ "#3e95cd", "#8e5ea2" ],
							label : "수익 비중"
						} ],
						labels : [ "펫시터", "쇼핑몰" ]
							
					},
					options : {
						title : {
							display : true,
							text : '수익 비중'
						}
					}
				});					
				
			},error : function(e) {
                alert("에러");
         }
		});

		
		
		$("#month").on("change", function() {
			
			//일단 차트 지우고 새로갱신
			$("#chart_1").remove();
			$("#chart_2").remove();
			$("#chartDiv1").append('<canvas id="chart_1"></canvas>');
			$("#chartDiv2").append('<canvas id="chart_2" width="500px;" height="300px;"></canvas>');
			
			
			
			// value 값으로 선택
			var year = $("#year").val();
			var month = $(this).val();
			if (year != 0 && month != 0) {
				$.ajax({
					url : "<c:url value='/admin/earn?year="+year+"&month="+month+"' />",
					dataType:"json",
					success : function(data) {
						
						
						//년 월
						var in_year = data.year;
						var in_month = data.month;
						
						
						//펫시터용 받는 부분
						var labelArray = new Array();
						var dataArray = new Array();
						var total = 0;//파이
						
						
						//쇼핑몰받는부분
						var labelArray_1 = new Array();
						var dataArray_1 = new Array();
						var total_1 = 0;//파이
						
						for (var i = 0; i < data.list.length; i++) {
							labelArray[i] = data.list[i].created_date;
							dataArray[i] = data.list[i].count;
							total +=data.list[i].count;
							console.log(data.list[i].count+", "+data.list[i].created_date);
						}
						
						for (var i = 0; i < data.list2.length; i++) {
							labelArray_1[i] = data.list2[i].created_date;
							dataArray_1[i] = data.list2[i].count;
							total_1 +=data.list2[i].count;
						}
						
						
						/* 창 열었을 때 첫번째 차트에 월별 차트넣기 default 값은 현재 월의 차트 */
						new Chart(document.getElementById("chart_1"), {
							type : 'line',
							data : {
								labels : labelArray,
								datasets : [
										{
											data : dataArray,
											label : "펫시터",
											borderColor : "#3e95cd",
											fill : false
										},
										{
											data : dataArray_1,
											label : "쇼핑몰",
											borderColor : "#8e5ea2",
											fill : false
										} ]
							},
							options : {
								title : {
									display : true,
									text : in_year+"년 "+in_month+"월 수익"
								}
							}
						});
						
						//파이차트
						new Chart(document.getElementById("chart_2"), {
							type : 'pie',
							data : {
								labels : [ "펫시터", "쇼핑몰" ],
								datasets : [ {
									label : "수익 비중",
									backgroundColor : [ "#3e95cd", "#8e5ea2" ],
									data : [ total, total_1 ]
								} ]
							},
							options : {
								title : {
									display : true,
									text : '수익 비중'
								}
							}
						});
						
						
						
						
						
					},error : function(e) {
		                alert("에러");
		         }
				});
			} 
		});
		
		
		
		
		
	});

	/* 
	 $.ajax({
	 url : "AJAX_POST_URL",
	 type: "POST",
	 data : formData,
	 success: function(data, textStatus, jqXHR)
	 {
	 //data - response from server
	 },
	 error: function (jqXHR, textStatus, errorThrown)
	 {
	
	 }
	 }); 
	
	
		<select id="year">
							<option value="0">---</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
						</select> 년 <select id="month">
							<option value ="0">---</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> 월
	
	
	 */

	function gogo() {

		new Chart(document.getElementById("chart_1"), {
			type : 'line',
			data : {
				labels : [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
						16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
						30, 31 ],
				datasets : [
						{
							data : [ 86, 114, 106, 106, 107, 111, 133, 221,
									783, 2478 ],
							label : "펫시터",
							borderColor : "#3e95cd",
							fill : false
						},
						{
							data : [ 282, 350, 411, 502, 635, 809, 947, 1402,
									3700, 5267 ],
							label : "쇼핑몰",
							borderColor : "#8e5ea2",
							fill : false
						} ]
			},
			options : {
				title : {
					display : true,
					text : '펫케어 수익'
				}
			}
		});

		new Chart(document.getElementById("chart_2"), {
			type : 'pie',
			data : {
				labels : [ "Africa", "Asia", "Europe", "Latin America",
						"North America" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9", "#c45850" ],
					data : [ 2478, 5267, 734, 784, 433 ]
				} ]
			},
			options : {
				title : {
					display : true,
					text : 'Predicted world population (millions) in 2050'
				}
			}
		});

		new Chart(document.getElementById("canvasRadar"), {
			type : 'horizontalBar',
			data : {
				labels : [ "Africa", "Asia", "Europe", "Latin America",
						"North America" ],
				datasets : [ {
					label : "Population (millions)",
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#3cba9f",
							"#e8c3b9", "#c45850" ],
					data : [ 2478, 5267, 734, 784, 433 ]
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : 'Predicted world population (millions) in 2050'
				}
			}
		});

		new Chart(document.getElementById("bar-chart-grouped"), {
			type : 'bar',
			data : {
				labels : [ "1900", "1950", "1999", "2050" ],
				datasets : [ {
					label : "Africa",
					backgroundColor : "#3e95cd",
					data : [ 133, 221, 783, 2478 ]
				}, {
					label : "Europe",
					backgroundColor : "#8e5ea2",
					data : [ 408, 547, 675, 734 ]
				} ]
			},
			options : {
				title : {
					display : true,
					text : 'Population growth (millions)'
				}
			}
		});

	}
</script>