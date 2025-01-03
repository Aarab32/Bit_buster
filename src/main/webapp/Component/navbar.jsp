<%@page import="com.learn.ecommerce.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");


%>



<nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary custom-bg">
    <div class="container-fluid">
        <a class="navbar-brand" href="about.jsp">Ecommerce</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Cateogries</a>
                    <ul class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-item"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </ul>
                </li>

            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <ul class ="navbar-nav ml-auto">
            <%            if (user1 == null) {
            %>

            <li class="nav-item  active">
                <a class="nav-link" aria-current="page" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " aria-current="page" href="register.jsp">Register</a>
            </li>

            <%
            } else {

            %>

            <li class="nav-item  active">
                <a class="nav-link" aria-current="page" href="admin.jsp"><%=user1.getUserName()%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link " aria-current="page" href="LogoutServlet">Logout</a>
            </li>

            <%

                }

            %>



        </ul>

    </div>
</nav>