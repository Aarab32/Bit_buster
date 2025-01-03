

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%@include file= "Component/Common_css_js.jsp" %>
    </head>
    
        <%@include  file="Component/navbar.jsp"%> 

        <div class="row mt-5">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <div class="container custom-bg text-white"> <h3 class="text-centre my-3 ">Sign up here</h3></div>
         <%@include file="Component/message.jsp" %>
                        <form action="RegisterServlet" method="post">

                            <div class="form-group">
                                <label for="name" class="form-label">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="email" class="form-label">User Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="password" class="form-label">User Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="phone" class="form-label">User Phone no.</label>
                                <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="address" class="form-label">User Address</label>
                                <textarea name="user_address" class="form-control" placeholder="Enter your address"></textarea>
                            </div>

                            <div class="container text-centre" >
                                <button class="btn-outline-success">Register</button>
                                <button class="btn-outline-warning">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    

