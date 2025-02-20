/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.ecommerce.servlet;

import com.learn.ecommerce.dao.CategoryDao;
import com.learn.ecommerce.dao.ProductDao;
import com.learn.ecommerce.entities.Category;
import com.learn.ecommerce.entities.Product;
import com.learn.ecommerce.helper.FactoryProvider;
import java.io.IOException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig

public class ProductOperationServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           String op=request.getParameter("operation");
           if(op.trim().equals("addcategory")){
               //add category
                  //fetching category data
            String title = request.getParameter("catTitle");
            String description = request.getParameter("catDescription");
            
               Category category = new Category();
               category.setCategoryTitle(title);
               category.setCategoryDescription(description);
               //category database save
               CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
               int catId=categoryDao.saveCategory(category);
               //show message in new page
               //out.println("Category Saved");
               
               //show message on admin page
               HttpSession httpsession = request.getSession();
               httpsession.setAttribute("message", "Category added Successfully "+catId +title+"\n"+ description );
               response.sendRedirect("admin.jsp");
               return;
           }else if(op.trim().equals("addproduct")){
               //add product
               String pName = request.getParameter("pName");
               int pPrice = Integer.parseInt(request.getParameter("pPrice"));
               int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
               int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
               String pDesc = request.getParameter("pDesc");
               int catId = Integer.parseInt(request.getParameter("catId"));
               Part part=request.getPart("pPic");
               
               Product p = new Product();
               p.setpName(pName);
               p.setpPrice(pPrice);
               p.setpDiscount(pDiscount);
               p.setpQuantity(pQuantity);
               p.setpDesc(pDesc);
               p.setpPhoto(part.getSubmittedFileName());
               
               
               CategoryDao cdoa= new CategoryDao(FactoryProvider.getFactory());
               Category category = cdoa.getCategoryById(catId);
               p.setCategory(category);
               
               ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
               pdao.saveProduct(p);
               //finding the path of pic
               String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
               
               
               try {
                    FileOutputStream fos= new FileOutputStream(path);
               InputStream is=part.getInputStream();
               
               //reading data
               byte []data= new byte[is.available()];
               is.read(data);
               
               fos.write(data);
               fos.close();
                   
               } catch (Exception e) {
                   e.printStackTrace();
               }
              
               
               
               
               //out.println("Product save sucess....");
               // show message on admin page
               HttpSession httpsession = request.getSession();
               httpsession.setAttribute("message", "Product added Successfully " );
               response.sendRedirect("admin.jsp");
               return;
               
           }
            
            
         
         
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
