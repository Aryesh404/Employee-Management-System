

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class WelcomeServlet
 */
@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user information from the session
        User user = (User) request.getSession().getAttribute("user");

        // Check if the user is logged in
        if (user != null) {
            // Forward to the welcome page
            request.setAttribute("user", user);  // Set user attribute for the JSP
            request.getRequestDispatcher("/welcome.jsp").forward(request, response);
        } else {
            // If the user is not logged in, redirect to the login page
            response.sendRedirect("login.jsp");
        }
    }
}
