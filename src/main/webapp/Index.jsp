<!DOCTYPE html>
<html>
<head>
    <title>Flight Search</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .topbar {
            display: flex;
            justify-content: flex-end;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.3);
        }

        .topbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            border-radius: 5px;
        }

        .topbar a:hover {
            background-color: #45a049;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
            flex-direction: column;
        }

        form {
            background-color: rgba(0, 0, 0, 0.3);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 500px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        select, input[type="submit"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #2196F3;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1976D2;
        }

        .filter-toggle {
            cursor: pointer;
            color: #fff;
            background-color: #4CAF50;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            width: 100%;
            margin-top: 10px;
        }

        .filter-toggle:hover {
            background-color: #45a049;
        }

        .filter-section {
            display: none;
        }
    </style>
    <script>
        function toggleFilters() {
            var section = document.getElementById("filters");
            section.style.display = (section.style.display === "none" || section.style.display === "") ? "block" : "none";
        }
    </script>
</head>
<body>

    <div class="topbar">
        <a href="login.jsp">Login</a>
    </div>

    <div class="form-container">
        <form action="FlightServlet" method="POST">
            <label for="from">From:</label>
            <select name="fromCity" id="from" required>
                <option value="Delhi">Delhi</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Bengaluru">Bengaluru</option>
                <option value="Chennai">Chennai</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Pune">Pune</option>
                <option value="Goa">Goa</option>
            </select>

            <label for="to">To:</label>
            <select name="toCity" id="to" required>
                <option value="Delhi">Delhi</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Bengaluru">Bengaluru</option>
                <option value="Chennai">Chennai</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Pune">Pune</option>
                <option value="Goa">Goa</option>
            </select>

            <label for="date">Date:</label>
            <input type="date" name="date" id="date" required>

            <!-- Filter toggle -->
            <div class="filter-toggle" onclick="toggleFilters()">Show/Hide Filters</div>

            <!-- Filter section -->
            <div class="filter-section" id="filters">
                <label for="lowPrice">Min Price:</label>
                <input type="number" name="lowPrice" id="lowPrice" placeholder="Min Price" step="0.01">

                <label for="highPrice">Max Price:</label>
                <input type="number" name="highPrice" id="highPrice" placeholder="Max Price" step="0.01">
            </div>
            <input type="hidden" name="book" value="false">
            <input type="submit" value="Search Flights">
        </form>
    </div>

</body>
</html>
