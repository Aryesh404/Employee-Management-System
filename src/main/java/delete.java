

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
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		;
		
		  String delete = request.getParameter("id");
		  
		  int id = Integer.parseInt(delete);
		
		
		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "");
		    String sql = "DELETE FROM employee_details WHERE id = '"+id+"'";
		    PreparedStatement psmt = conn.prepareStatement(sql);
		   
		    
		    int rowsDeleted = psmt.executeUpdate();

		    if (rowsDeleted > 0) {
		        // The delete was successful
		        response.sendRedirect("index.jsp");
		    } else {
		        // No rows were deleted (user with the given ID not found)
		        response.getWriter().println("No employee found with the specified ID.");
		    }

		    psmt.close();
		    conn.close();
		} catch (ClassNotFoundException e) {
		    response.getWriter().println("Error: Database driver not found.");
		    e.printStackTrace();
		} catch (SQLException e) {
		    response.getWriter().println("Error: SQL Exception - " + e.getMessage());
		    e.printStackTrace();
		}

	}

}
