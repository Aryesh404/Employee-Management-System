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
@WebServlet("/contactus")
public class contactus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public contactus() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "")) {
                String sql = "INSERT INTO contact_us (name, email, message) VALUES (?, ?, ?)";
                try (PreparedStatement pst = conn.prepareStatement(sql)) {
                    pst.setString(1, name);
                    pst.setString(2, email);
                    pst.setString(3, message);

                    int rs = pst.executeUpdate();

                    PrintWriter out = response.getWriter();
                    if (rs > 0) {
                        out.print("Thank you! Your message has been submitted.");
                        response.sendRedirect("index.jsp");
                    } else {
                        // Handle the case where the insertion failed
                        out.print("Error submitting the message. Please try again.");
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log the exception or handle it appropriately
            // Provide an error message to the user
            response.getWriter().print("Error processing the request. Please try again later.");
        }
    }
}
