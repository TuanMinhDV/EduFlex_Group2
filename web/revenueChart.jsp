<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map, java.util.HashMap, java.util.Map.Entry" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <style>
            /* Reset margin and padding */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                height: 100vh;
            }
            /* Sidebar */
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: #fff;
                display: flex;
                flex-direction: column;
                padding-top: 20px;
            }
            .sidebar h2 {
                text-align: center;
                font-size: 24px;
                padding: 10px 0;
                border-bottom: 1px solid #34495e;
            }
            .sidebar a {
                color: #ecf0f1;
                padding: 15px 20px;
                text-decoration: none;
                font-size: 18px;
                display: block;
                transition: background 0.3s;
            }
            .sidebar a:hover {
                background-color: #34495e;
            }
            /* Main content */
            .content {
                flex: 1;
                padding: 20px;
            }
            .content h1 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }
            .card {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .card h3 {
                margin-bottom: 10px;
                color: #2c3e50;
            }
            /* Chart Style */
            #chart_div {
                width: 100%;
                height: 500px;
                margin-top: 20px;
            }
            /* Form Styling */
            form label, form input {
                font-size: 16px;
                margin-right: 10px;
            }
            form button {
                padding: 5px 10px;
                background-color: #3498db;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            form button:hover {
                background-color: #2980b9;
            }
        </style>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Month', 'Revenue'],
                    <% 
                        Map<String, Double> revenueData = (Map<String, Double>) request.getAttribute("revenueData");
                        for (Map.Entry<String, Double> entry : revenueData.entrySet()) {
                            out.print("['" + entry.getKey() + "', " + entry.getValue() + "],");
                        }
                    %>
                ]);

                var options = {
                    title: 'Revenue Chart',
                    hAxis: {title: 'Month'},
                    vAxis: {title: 'Revenue'}
                };

                var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>EduFlex Admin</h2>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/adminhomeservlet">Home</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewaccountlistbyadmin">View Account List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcommentlistbyadmin">View Comment List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewcourselistbyadmin">View Course List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/ViewOrderListByAdmin">View Order List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/viewsubjectbyadmin">View Category List</a>
            <a class="btn btn-primary" href="http://localhost:8080/EduFlex_Demo3_1_1/revenueChart">Revenue</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h1>Dashboard</h1>
            <div class="card">
                <h3>Filter Revenue by Date</h3>
                <form action="revenueChart" method="get">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" required>
                    
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" required>
                    
                    <button type="submit">Filter</button>
                </form>
            </div>

            <div class="card">
                <h3>Total Revenue</h3>
                <p>Total Revenue: $<%= request.getAttribute("totalRevenue") %></p>
                <p>Average Order Value: $<%= request.getAttribute("averageOrderValue") %></p>
            </div>

            <div class="card">
                <h3>Revenue Chart</h3>
                <div id="chart_div"></div>
            </div>
        </div>
    </body>
</html>
