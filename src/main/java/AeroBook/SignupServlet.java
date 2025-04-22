package AeroBook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (Users.map.containsKey(username)) {
            response.getWriter().write("Username already exists. Please choose another.");
        } else {
            // Add new user to the map

            Users a = new Users(username,password);
            Users.map.put(username,a);
            response.getWriter().write("Signup successful! You can now log in.");
            response.sendRedirect("login.jsp");
        }
    }
}
