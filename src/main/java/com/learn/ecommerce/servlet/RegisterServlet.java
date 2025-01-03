/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.ecommerce.servlet;

import com.learn.ecommerce.entities.User;
import com.learn.ecommerce.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author aarab
 */
public class RegisterServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
       try{
           String userName = request.getParameter("user_name");
           String userEmail = request.getParameter("user_email");
           String userPassword= request.getParameter("user_password");
           String userPhone = request.getParameter("user_phone");
           String userAddress = request.getParameter("user_address");
           
           //validations
           if(userName.isEmpty()){
               out.println("Name is Empty");
               return;
           }
           if(userEmail.isEmpty()){
               out.println("Email is Empty");
               return;
           }
           if(userPassword.isEmpty()){
               out.println("Password is Empty");
               return;
           }
           //creating user object to store data
          User user= new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
   
           Session hibernateSession = FactoryProvider.getFactory().openSession();
           
           Transaction tx = hibernateSession.beginTransaction();
           
           int userId;
           userId = (int) hibernateSession.save(user);
           
           
           tx.commit();
          hibernateSession.close();
          HttpSession httpsession = request.getSession();
          httpsession.setAttribute("message","Registration Successful "+ userId);
          response.sendRedirect("register.jsp");
          
       
           
           
       }catch (Exception e){
           e.printStackTrace();
       }
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
