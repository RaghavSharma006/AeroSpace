package AeroBook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/FlightServlet")
public class FlightServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");
        String date = request.getParameter("date");

        // Default price range
        double lowPrice = 0;
        double highPrice = 9999999;

        // Handling price range
        try {
            if (request.getParameter("lowPrice") != null && !request.getParameter("lowPrice").isEmpty()) {
                lowPrice = Double.parseDouble(request.getParameter("lowPrice"));
            }
            if (request.getParameter("highPrice") != null && !request.getParameter("highPrice").isEmpty()) {
                highPrice = Double.parseDouble(request.getParameter("highPrice"));
            }
        } catch (NumberFormatException e) {
            // Handle price parsing error if needed (you could log it if required)
        }

        // Search for flights (replace with your actual search logic)
        List<Flights> filteredFlights = Flights.search(fromCity, toCity, date, lowPrice, highPrice);

        // Retrieve the username from the form
        String username = request.getParameter("username");

        // Set content type to HTML for response
        response.setContentType("text/html");
        response.getWriter().println("<html><body>");

        // Check if the 'book' attribute is set to 'true'
        String book = request.getParameter("book");

        if (book != null && book.equals("true")) {
            // Assuming user is stored in a Map with the username as the key
            Users user = Users.map.get(username);  // Retrieve the user using the username
            
            if (user != null) {
                // Assuming user wants to book the first available flight (this can be modified)
                if (!filteredFlights.isEmpty()) {
                    Flights selectedFlight = filteredFlights.get(0);  // Select the first flight (modify as needed)
                    
                    // Add the flight to the user's ticket list
                    user.ticket.add(selectedFlight);  // Add the flight to the user's ticket list
                    
                    // Display booking confirmation message
                    response.getWriter().println("<h2>Flight successfully booked!</h2>");
                    response.getWriter().println("<p>Date: " + selectedFlight.getDate() + "</p>");
                    response.getWriter().println("<p>From: " + selectedFlight.getFromCity() + "</p>");
                    response.getWriter().println("<p>To: " + selectedFlight.getToCity() + "</p>");
                } else {
                    // Handle the case where no flights are available
                    response.getWriter().println("<h2>No flights found for your search.</h2>");
                }
            } else {
                // Handle case where user is not logged in or not found
                response.getWriter().println("<h2>You must be logged in to book a flight.</h2>");
            }
        } else {
            // If 'book' is not true, forward to the results page (normal behavior)
            request.setAttribute("filteredFlights", filteredFlights);
            request.getRequestDispatcher("/FlightsResults.jsp").forward(request, response);
        }

        response.getWriter().println("</body></html>");
    }
}
