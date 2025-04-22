package AeroBook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/ShowTicketServlet")
public class ShowTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ShowTicketServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Users user = Users.map.get(username);

        if (user == null) {
            out.println("<h2>User not found. Please log in again.</h2>");
            return;
        }

        List<Flights> tickets = user.ticket;

        out.println("<html><head><title>Booked Tickets</title>");
        out.println("<style>");
        out.println("body { font-family: Arial; background: #1e1e2f; color: white; padding: 20px; }");
        out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; background-color: #2c2f48; }");
        out.println("th, td { padding: 12px; border: 1px solid #444; }");
        out.println("th { background-color: #3b3f5c; }");
        out.println("</style>");
        out.println("</head><body>");

        out.println("<h2>Booked Tickets for " + user.getUsername() + "</h2>");

        if (tickets == null || tickets.isEmpty()) {
            out.println("<p>No tickets booked yet.</p>");
        } else {
            out.println("<table>");
            out.println("<tr><th>From</th><th>To</th><th>Date</th><th>Price</th><th>Refundable</th></tr>");
            for (Flights f : tickets) {
                out.println("<tr>");
                out.println("<td>" + f.getFromCity() + "</td>");
                out.println("<td>" + f.getToCity() + "</td>");
                out.println("<td>" + f.getDate() + "</td>");
                out.println("<td>" + f.getPrice() + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        }

        out.println("</body></html>");
    }
    }
