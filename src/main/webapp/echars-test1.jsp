<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <script src="echarts/dist/echarts.min.js"></script>
    </head>
    <body>
        <div id="main" style="width:600px; height:400px;"></div>
    </body>
</html>

<script>

    var myChart = echarts.init(document.getElementById('main'));

    // specify chart configuration item and data
    var option = {
        title: {
            text: 'ECharts entry example'
        },
        tooltip: {},
        legend: {
            data:['Sales']
        },
        xAxis: {
            data: ["shirt","cardign","chiffon shirt","pants","heels","socks"]
        },
        yAxis: {},
        series: [{
            name: 'Sales',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };

    // use configuration item and data specified to show chart
    myChart.setOption(option);
</script>