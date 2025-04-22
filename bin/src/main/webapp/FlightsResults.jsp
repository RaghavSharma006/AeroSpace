<%@ page import="AeroBook.Flights" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Flight Search Results</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Flight Search Results</h1>

    <table>
        <thead>
            <tr>
                <th>From City</th>
                <th>To City</th>
                <th>Date</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <%-- Iterate over the list of filtered flights and display them --%>
            <%
                List<Flights> flights = (List<Flights>) request.getAttribute("filteredFlights");
                if (flights != null && !flights.isEmpty()) {
                    for (Flights flight : flights) {
            %>
                        <tr>
                            <td><%= flight.getFromCity() %></td>
                            <td><%= flight.getToCity() %></td>
                            <td><%= flight.getDate() %></td>
                            <td><%= flight.getPrice() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="4" style="text-align: center;">No flights found for the selected criteria.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <br>
    <a href="Index.jsp" style="text-align: center; display: block;">Go back to search page</a>
</body>
</html>
