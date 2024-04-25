
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

/**
 * Servlet implementation class update
 */
//Import statements remain unchanged
@WebServlet("/update")
public class update extends HttpServlet {
 private static final long serialVersionUID = 1L;

 public update() {
     super();
 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     response.getWriter().append("Served at: ").append(request.getContextPath());
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String id = request.getParameter("id");
     String name = request.getParameter("name");
     String password = request.getParameter("password");
     String email = request.getParameter("email");
     String designation = request.getParameter("designation");
     String salary = request.getParameter("salary");

     PrintWriter out = response.getWriter();
     out.print("id  " + id);
     out.println("name  " + name);

     try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "")) {
             String sql = "UPDATE employee_details SET name = ?, password = ?, email = ?, designation = ?, salary = ? WHERE id = ?";
             try (PreparedStatement psmt = conn.prepareStatement(sql)) {
                 psmt.setString(1, name);
                 psmt.setString(2, password);
                 psmt.setString(3, email);
                 psmt.setString(4, designation);
                 psmt.setString(5, salary);
                 psmt.setString(6, id);

                 int rowsUpdated = psmt.executeUpdate();

                 if (rowsUpdated > 0) {
                     // The update was successful
                     response.sendRedirect("index.jsp");
                 } else {
                     // No rows were updated (user with given ID not found)
                     response.getWriter().println("No employee found with the specified ID.");
                 }
             }
         }
     } catch (ClassNotFoundException | SQLException e) {
         response.getWriter().println("Error: " + e.getMessage());
         e.printStackTrace();
     }
 }
}
