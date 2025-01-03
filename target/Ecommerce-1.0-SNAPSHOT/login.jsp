

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User login</title>
        <%@include file="Component/Common_css_js.jsp"%>
    </head>
    <%@include  file="Component/navbar.jsp"%> 
    <body>

        <div class="container">
            <div class="row md-5">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3 ">
                        <div class="card-header custom-bg text-white">
                            <h3>Login</h3>


                        </div>
                        <div class="card-body">
                            <%@include file="Component/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                <a href="register.jsp">If not register click here </a>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>

                            </form>

                        </div>
                        <div class="card-footer">


                        </div>
                    </div>

                </div>

            </div>
        </div>
       
    </body>
</html>
