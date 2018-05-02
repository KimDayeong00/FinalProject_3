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
							<button class="btn btn-default" type="button" >Go!</button>
						</span>
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
							Line graph<small>Sessions</small>
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
						<canvas id="mybarChart"></canvas>
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
						<canvas id="canvasDoughnut"></canvas>
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

		var data = {

		        labels: ["월","화","수","목","금","토","일"],

		        datasets: [

		            {

		                label: "",

		                fillColor: "rgba(220,220,220,0.2)",

		                strokeColor: "rgba(220,220,220,1)",

		                pointColor: "rgba(220,220,220,1)",

		                pointStrokeColor: "#fff",

		                pointHighlightFill: "#fff",

		                pointHighlightStroke: "rgba(220,220,220,1)",

		                data: [2, 3, 5, 7, 11, 13, 17]

		            },

		            {

		                label: "",

		                fillColor: "rgba(151,187,205,0.2)",

		                strokeColor: "rgba(151,187,205,1)",

		                pointColor: "rgba(151,187,205,1)",

		                pointStrokeColor: "#fff",

		                pointHighlightFill: "#fff",

		                pointHighlightStroke: "rgba(151,187,205,1)",

		                data: [0, 1, 1, 2, 3, 5, 8]

		            }

		        ]

		    };

		    var ctx = document.getElementById("lineChart").getContext("2d");

		    var options = { };

		    var lineChart = new Chart(ctx).Line(data, options);
	
	 
	
		    
			 
/* 
		    // Global Options:
		     Chart.defaults.global.defaultFontColor = 'black';
		     Chart.defaults.global.defaultFontSize = 16;

		    var data = {
		        labels: ["She returns it ", "She keeps it"],
		          datasets: [
		            {
		                fill: true,
		                backgroundColor: [
		                    'black',
		                    'white'],
		                data: [5, 95],
		    // Notice the borderColor 
		                borderColor:	['black', 'black'],
		                borderWidth: [2,2]
		            }
		        ]
		    };

		    // Notice the rotation from the documentation.

		    var options = {
		            title: {
		                      display: true,
		                      text: 'What happens when you lend your favorite t-shirt to a girl ?',
		                      position: 'top'
		                  },
		            rotation: -0.7 * Math.PI
		    };
			
		    alert("옴?");
		    var ctx = document.getElementById("mybarChart").getContext('2d');
		    // Chart declaration:
		    var myBarChart = new Chart(ctx, {
		        type: 'pie',
		        data: data,
		        options: options
		    });

			  */
	
	}
</script>

<script src="<c:url value="/resources/admin/vendors/jquery/dist/jquery.min.js" />"></script>
