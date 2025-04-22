package AeroBook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Aero")
public class Aero extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Aero() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type to HTML
        response.setContentType("text/html");

        // Get the output writer
        PrintWriter out = response.getWriter();

        // Write HTML content
        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>AeroBook</title></head><body>");
        out.println("<h1>🛫 Welcome to AeroBook Flight Reservation</h1>");
        out.println("<p>Your booking assistant in the skies!</p>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward POST to GET
        doGet(request, response);
    }
}
