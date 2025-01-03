
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerce.entities.Category"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page import="com.learn.ecommerce.dao.CategoryDao"%>
<%@page import="com.learn.ecommerce.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin , not alloyed to access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>








<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="Component/Common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <h1>This is Admin page</h1>

        <div class =" container">
            <div class="container-fluid mt-3">
                <%@include file="Component/message.jsp"  %>


            </div>



            <div class="row mt-4">


                <!-- Users -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 250px;" class="img-fluid rounded-circle" src="Image/team.png" alt="user_icon" >
                            </div>

                            <h1>Users</h1>

                        </div>
                    </div>

                </div>

                <!-- categories -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 250px;" class="img-fluid " src="Image/list.png" alt="user_icon" >
                            </div>
                            <h1>Categories</h1>

                        </div>
                    </div>

                </div>

                <!-- Products -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 250px;" class="img-fluid rounded-circle" src="Image/checklist.png" alt="user_icon" >
                            </div>
                            <h1>Products</h1>

                        </div>
                    </div>

                </div>

            </div>
            <!-- Second row -->
            <div class="row mt-4">

                <!-- Add product-->
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 250px;" class="img-fluid " src="Image/add-product.png" alt="user_icon" >
                            </div>
                            <h1>Add product</h1>

                        </div>
                    </div>

                </div>

                <!-- Add new category -->
                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 250px;" class="img-fluid " src="Image/apps.png" alt="user_icon" >
                            </div>
                            <h1>Add Category</h1>

                        </div>
                    </div>

                </div>


            </div>
        </div>

        <!--add category modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill category detail</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required /> 
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter category description" name="catDescription"></textarea>

                            </div>

                            <div class="container">
                                <button class="btn btn-outline-success">Add Category</button>

                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!-- End category modal -->


        <!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


        <!-- Add Product modal -->

        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Product detail</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addproduct">

                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product name" required /> 
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Product price" required /> 
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter discount on Product" required /> 
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter quantity of Product" required /> 
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter Product description" name="pDesc"></textarea>

                            </div> 
                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>
                                <input type="file" id="pPic" class="form-control" name="pPic"  required /> 
                            </div>

                            <!-- product category -->

                            <%                                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();

                            %>

                            <div class="form-group">

                                <select name="catId" class="form-control" id="">

                                    <%                                            for (Category c : list) {
                                    %>

                                    <option value="<%=c.getCategoryId()%>"> <%=c.getCategoryTitle()%> </option>


                                    <%
                                        }
                                    %>

                                </select>

                            </div>



                            <div class="container">
                                <button class="btn btn-outline-success">Add Product</button>

                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>



        <!-- End Product modal -->
    </body>
</html>
