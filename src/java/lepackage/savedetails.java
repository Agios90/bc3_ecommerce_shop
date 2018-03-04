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

@WebServlet(name = "savedetails", urlPatterns = {"/savedetails"})
public class savedetails extends HttpServlet {

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
        
        HttpSession session = request.getSession();

        try{
        clientid = (int) session.getAttribute("clientid");
        }catch (Exception e){
            response.sendRedirect("errors/UserNotFound.html");
        }
         
         String sql1; String sql2; String sql3; String sql4; String sql5;
         PreparedStatement pstmt = null;
         String address,city,email,phone,pcode;
         
         sql1 = "UPDATE clients SET address=? WHERE clientid=?";
         pstmt = conn.prepareStatement(sql1);
         address = request.getParameter("address");
         pstmt.setString(1,address);
         pstmt.setInt(2,clientid);
         pstmt.executeUpdate();
         
         sql2 = "UPDATE clients SET pcode=? WHERE clientid=?";
         pstmt = conn.prepareStatement(sql2);
         pcode = request.getParameter("pcode");
         pstmt.setString(1,pcode);
         pstmt.setInt(2,clientid);
         pstmt.executeUpdate();
         
         sql3 = "UPDATE clients SET city=? WHERE clientid=?";
         pstmt = conn.prepareStatement(sql3);
         city = request.getParameter("city");
         pstmt.setString(1,city);
         pstmt.setInt(2,clientid);
         pstmt.executeUpdate();
         
         sql4 = "UPDATE clients SET phone=? WHERE clientid=?";
         pstmt = conn.prepareStatement(sql4);
         phone = request.getParameter("phone");
         pstmt.setString(1,phone);
         pstmt.setInt(2,clientid);
         pstmt.executeUpdate();
         
         sql5 = "UPDATE clients SET email=? WHERE clientid=?";
         pstmt = conn.prepareStatement(sql5);
         email = request.getParameter("email");
         pstmt.setString(1,email);
         pstmt.setInt(2,clientid);
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

