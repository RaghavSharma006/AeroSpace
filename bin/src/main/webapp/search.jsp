
<%@ page import="AeroBook.Users" %> <!-- Import the Users class -->
<% 
    Users user1 = (Users) request.getAttribute("user"); // Cast to User type since it is a User object in the map
    if (user1 == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>Welcome, <%= user1.getUsername() %>!</h2>
<!-- Add other code to display flight options here -->

<!DOCTYPE html>
<html>
<head>
    <title>Flight Search (Logged In)</title>
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
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.3);
        }

        .topbar span {
            font-size: 18px;
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
            flex-direction: column;
            min-height: 90vh;
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

        select, input[type="submit"], input[type="number"], input[type="date"] {
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

        .book-btn {
            margin-top: 20px;
            background-color: #FFC107;
            color: black;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }

        .book-btn:hover {
            background-color: #FFA000;
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
    <span>Welcome, <%= user1.getUsername() %>!</span>
    <form action="ShowTicketServlet" method="POST" style="margin: 0;">
        <input type="hidden" name="username" value="<%= user1.getUsername() %>">
        <input type="submit" value="Check Tickets" style="
            background-color: #FFC107;
            color: black;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        ">
    </form>
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

            <div class="filter-toggle" onclick="toggleFilters()">Show/Hide Filters</div>

            <div class="filter-section" id="filters">
                <label for="lowPrice">Min Price:</label>
                <input type="number" name="lowPrice" id="lowPrice" placeholder="Min Price" step="0.01">

                <label for="highPrice">Max Price:</label>
                <input type="number" name="highPrice" id="highPrice" placeholder="Max Price" step="0.01">

                <label for="refundable">Refundable:</label>
                <select name="refundable" id="refundable">
                    <option value="true">Yes</option>
                    <option value="false">No</option>
                </select>
            </div>
            <input type="hidden" name="book" value="true">
            <input type="hidden" name="username" value="<%= user1.getUsername() %>">
            <input type="submit" value="Book Flight">
        </form>

    </div>

</body>
</html>
