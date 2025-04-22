package AeroBook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValidUser = Users.map.containsKey(username);

        if (isValidUser && Users.map.get(username).getPassword().equals(password)) {
            request.setAttribute("user",Users.map.get(username));
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } else if (isValidUser) {
            response.getWriter().write("Wrong Password");
        } else {
            response.sendRedirect("signup.jsp");
        }
	}

}
