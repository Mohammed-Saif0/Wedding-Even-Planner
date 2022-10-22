/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import java.util.*;
import java.text.*;

import Database.DBQuery;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author moham
 */
public class transaction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            int b = (int)(Math.random()*(100000-0));  
            int b = 87181;
            DBQuery db = new DBQuery();
            int i = db.check_transaction(b);
            while(i!=0){
                i = db.check_transaction(b);
                b = (int)(Math.random()*(100000-0)); 
            }
            
            String username = request.getParameter("username");
            String price = request.getParameter("price");
             Date dNow = new Date( );
              SimpleDateFormat ft =new SimpleDateFormat ("yyyy-MM-dd");
            
              String date = ft.format(dNow);
              db.insert_into_payment(b, username, price, date);
              db.insert_into_paid_service(username, b);
              db.delete_booked_services(username,1);
              db.insert_into_paid_venue(username, b);
              db.delete_from_booked_venue(username,1);
               RequestDispatcher rd = null;
                rd = request.getRequestDispatcher("./user/view_completed_booking.jsp");
                rd.forward(request, response);
        }
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
