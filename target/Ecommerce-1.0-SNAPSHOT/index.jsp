

<%@page import="com.learn.ecommerce.helper.Helper"%>
<%@page import="com.learn.ecommerce.entities.Category"%>
<%@page import="com.learn.ecommerce.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerce.entities.Product"%>
<%@page import="com.learn.ecommerce.dao.ProductDao"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce</title>
        <%@include file= "Component/Common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>

        <div class="row mt-3 mx-2">
            
            
            <%                String cat = request.getParameter("category");
                out.println(cat);
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list=null;
                if (cat.trim().equals("all")) {
                     list = list = dao.getAllproducts();
                }else{
                int cid=Integer.parseInt(cat);
               list= dao.getAllproductsById(cid);
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();

            %>



            <!-- show categories -->
            <div class="col-md-2">

                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                        All Products
                    </a>





                    <%                        for (Category c : clist) {
                    %>
                   
                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                    <%
                        }
                    %>  
                </div>

            </div>

            <!-- show products -->
            <div class="col-md-10">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <%
                                for (Product p : list) {
                            %>
                            <div class="card" style="width: 18rem;">
                                <img src="Image/products/<%= p.getpPhoto()%>" style="max-height: 270px; max-width: 100%; width: auto;" class="card-img-top mt-2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    <p class="card-text"><%= Helper.get10Words(p.getpDesc())%></p>
                                </div>

                                <div class="card-footer">
                                    <h6>&#8377;<strike><%= p.getpPrice() %></strike>/- <span><%= p.getpDiscount() %>% off</span></h6>
                                    <h6>&#8377; <%= p.getPriceAfterDiscount()%>/-  </h6>
                                    <button class="btn custom-bg  ">Add to cart</button>
                                    <button class="btn custom-bg ">Buy now</button>
                                </div>
                            </div>



                            <%
                                }
                            %>

                        </div>

                    </div>                 

                </div>
            </div>

        </div>
    </body>
</html>
