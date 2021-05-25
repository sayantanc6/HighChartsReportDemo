<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<link rel="stylesheet" href="https://code.highcharts.com/css/highcharts.css" />
		<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" referrerpolicy="no-referrer" />
		<script src="https://code.highcharts.com/highcharts-3d.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	</head>
	
	<body>
        <div class="page-container">
            <div class="page-content-wrapper">
                <div class="page-head" style="background-color:#eff3f8;padding-top:40px">
                    <div class="container">
                        <div class="row" style="margin-bottom:30px">
                            <div class="col-md-6">
                                <h1>Sales: May - July</h1>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom:30px">
                            <div class="col-md-6" style="margin-top:20px">
                                <div id="salesByType" style="width:100%; height:400px;"></div>
                            </div>
                            <div class="col-md-6" style="margin-top:20px">
                                <div id="salesByRegion" style="width:100%; height:400px;"></div>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>                            
                        
      <script type="text/javascript"> 
         $(document).ready(function() {

        	 Highcharts.setOptions({
                 lang: {
                     decimalPoint: '.',
                     thousandsSep: ','
                 }
             });
        	 
             var salesByTypeChart = Highcharts.chart('salesByType', {
                 chart: {
                     type: 'column',
                     margin: 75,
                     options3d: {
							enabled: true,
                     	alpha: 15,
                     	beta: 15,
                     	depth: 110,
                     	viewDistance: 25,
                        depth: 40
                     }
                 },
                 title: {
                     text: 'Sales by Lure Type'
                 },
                 xAxis: {
                     categories: ['May', 'June', 'July']
                 },
                 yAxis: {
                     title: {
                         text: 'Sales (US $)'
                     }
                 },
                 tooltip: {
                	 valueSuffix: '\xB0C'
                 },
                 plotOptions: {
                 	column: {
                 		depth: 60,
                   		stacking: true,
                    		grouping: false,
                   		groupZPadding: 10
                     }
                 },
                 series: [{
                     name: 'Inshore',
                     data: ${inshoreSales}
                 }, {
                     name: 'Nearshore',
                     data: ${nearshoreSales}
                 }, {
                     name: 'Offshore',
                     data: ${offshoreSales}
                 }]
             });
        	 
            var salesByRegionChart = Highcharts.chart('salesByRegion', {
                chart: {
                    type: 'pie',
                    margin: 40,
                    options3d: {
                		enabled: true,
                        alpha: 45,
                        beta: 0
                    }
                },
                title: {
                    text: 'Sales by Region'
                },
                tooltip: {
                	valueSuffix: '\xB0C'
                },
                plotOptions: {
                	pie: {
                		allowPointSelect: true,
                		depth: 35
                	}
                },
                series: [{
                    name: 'Regions',
                    colorByPoint:true,
                    data: [{
                        name: 'Northeast',
                        y: ${northeastSales}
                    },{
                        name: 'South',
                        y:  ${southSales}
                    },{
                        name: 'Midwest',
                        y: ${midwestSales}
                    },{
                        name: 'West',
                        y: ${westSales}
                    }]
            	}]
            });
         });
      </script>
   </body>
</html>
