<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					Chart Js <small>Some examples to get you started</small>
				</h3>
				<input type="button" value="그래프!!" onclick="gogo();">
			</div>

			<div class="title_right">
				<div
					class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class="select_mate" data-mate-select="active" >

<select    id="year">
<option value="">---</option>
<option value="2015">2015</option>
<option value="2016" >2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
  </select>
년
<select   id="month">
<option value=""  >---</option>
<option value="01">01</option>
<option value="02" >02</option>
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
  </select>
월
  </div>				

					<div class="x_content">
						<canvas id="lineChart"></canvas>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Bar graph <small>Sessions</small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<canvas id="mybarChart" width="800" height="450"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Radar <small>Sessions</small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<canvas id="canvasRadar"></canvas>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Donut Graph <small>Sessions</small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<canvas id="bar-chart-grouped" width="800" height="450"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Pie Graph Chart <small>Sessions</small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<canvas id="pieChart"></canvas>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							Pie Area Graph <small>Sessions</small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<canvas id="polarArea"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- page content -->
<script>
	function gogo() {

		new Chart(document.getElementById("lineChart"), {
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

		new Chart(document.getElementById("mybarChart"), {
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


<script>
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
}); */





</script>



