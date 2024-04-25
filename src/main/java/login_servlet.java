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
import com.User;
@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login_servlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        // Authenticate the user and get user details if authenticated
        User userDetails = getUserDetails(name, password);

        if (userDetails != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userDetails", userDetails);
            response.sendRedirect("welcome.jsp");
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.print("<script>alert('Invalid login! Please try again.')</script>");
            out.print("<script>window.location.href='login.jsp'; </script>");
            out.close();
        }
    }

    private User getUserDetails(String name, String password) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testing", "root", "");

            String sql = "SELECT * FROM employee_details WHERE name = ? AND password = ?";
            try (PreparedStatement pst = conn.prepareStatement(sql)) {
                pst.setString(1, name);
                pst.setString(2, password);

                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next()) {
                        // Create a User object with retrieved details
                        User user = new User();
                        user.setName(rs.getString("name"));
                        user.setEmail(rs.getString("email"));
                        user.setDesignation(rs.getString("designation"));
                        user.setSalary(rs.getDouble("salary"));
                        // Add other user details as needed
                        return user;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
