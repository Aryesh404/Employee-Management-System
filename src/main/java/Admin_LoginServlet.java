import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/Admin_LoginServlet")
public class Admin_LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Admin_LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean authenticated = AuthenticatedUser(username, password);

        if (authenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("home.jsp");
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.print("<script>alert('Invalid login! Please try again.')</script>");
            out.print("<script>window.location.href='login.jsp'; </script>");
            out.close();
        }
    }

    private boolean AuthenticatedUser(String username, String password) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/project", "root", "");

            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement pst = conn.prepareStatement(sql);

            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            boolean authenticated = rs.next();

            return authenticated;
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions properly in a real application
        }
        return false;
    }
}
