/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lepackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
     // JDBC driver name and database URL
      static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      static final String DB_URL="jdbc:mysql://localhost/shop";

      //  Database credentials
      static final String USER = "root";
      static final String PASS = "nbuser";
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          response.setContentType("text/html");
      //PrintWriter out = response.getWriter();
      String title = "apotelesma an iparxei";
      
      String docType =
         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
      
      out.println(docType +
         "<html>\n");
      
      try {
          
         //response.sendRedirect("errors/UserNotFound.html");
          
         Class.forName("com.mysql.jdbc.Driver");
         // Open a connection
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         // Register JDBC driver
         // Execute SQL query
         
        int clientid=0;
        int productid=0;
        
        HttpSession session = request.getSession();

        try{
        clientid = (int) session.getAttribute("clientid");
        }catch (Exception e){
            response.sendRedirect("errors/UserNotFound.html");
        }
         String productname = request.getParameter("productname");
         int amountofkg = Integer.parseInt(request.getParameter("amountofkg"));
         
         
         
         String sql;
         PreparedStatement pstmt = null;
         
         sql = "SELECT productid,price from products where productname=?;";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,productname);
         ResultSet rs = pstmt.executeQuery();
         rs.next();
         productid = rs.getInt("productid");
         float price = rs.getFloat("price");
         float totalprice = price*amountofkg;
         
         sql = "INSERT INTO cart(clientid,productid,productname,quantity,totalprice) values (?,?,?,?,?);";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,clientid);
         pstmt.setInt(2,productid);
         pstmt.setString(3, productname);
         pstmt.setInt(4,amountofkg);
         pstmt.setFloat(5, totalprice);
         pstmt.executeUpdate();
         
           
         response.sendRedirect("index.jsp");
             
         
         out.println("</body></html>");

         // Clean-up environment
         pstmt.close();
         conn.close();
      } catch(SQLException se) {
         //Handle errors for JDBC
         out.println(se.toString());
      } catch(Exception e) {
         //Handle errors for Class.forName
         out.println(e.toString());
      } 
      } //end try

      
      
      
      
      
      
        }
    


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

