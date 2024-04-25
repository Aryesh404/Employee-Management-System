import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Registration_servlet")
public class Registration_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Registration_servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");
        double salary = Double.parseDouble(request.getParameter("salary"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "");

            String sql = "INSERT INTO employee_details (name, password, email, designation, salary) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement pst = conn.prepareStatement(sql)) {
                pst.setString(1, name);
                pst.setString(2, password);
                pst.setString(3, email);
                pst.setString(4, designation);
                pst.setDouble(5, salary);

                int rs = pst.executeUpdate();

                if (rs > 0) {
                    response.sendRedirect("login.jsp");
                } else {
                    // Handle registration failure, perhaps by redirecting to an error page
                    response.sendRedirect("registration_error.jsp");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Log the exception or print a meaningful message
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
