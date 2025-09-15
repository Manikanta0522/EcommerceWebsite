<%@ page import="com.ecommerce.model.User" %>
<%
    User loggedUser = (User) session.getAttribute("user");
%>
<!-- Sidebar -->
<aside class="w-64 bg-gray-900 text-white flex flex-col p-4 shadow-lg h-screen">
    <!-- Logo and main nav -->
    <div class="flex-grow">
        <!-- Logo -->
        <div class="flex items-center justify-between mb-8">
            <a href="<%=request.getContextPath()%>/index.jsp" class="text-2xl font-bold hover:text-gray-300 flex items-center">
                PremaloMart
            </a>
        </div>

        <nav class="flex flex-col space-y-2">
            <a href="<%=request.getContextPath()%>/index.jsp" class="flex items-center px-4 py-2 text-gray-300 hover:bg-gray-700 hover:text-white rounded-md">
                <i class="fas fa-home mr-3"></i> Home
            </a>
            <a href="<%=request.getContextPath()%>/products" class="flex items-center px-4 py-2 text-gray-300 hover:bg-gray-700 hover:text-white rounded-md">
                <i class="fas fa-box-open mr-3"></i> Products
            </a>
            <a href="<%=request.getContextPath()%>/cart" class="flex items-center px-4 py-2 text-gray-300 hover:bg-gray-700 hover:text-white rounded-md">
                <i class="fas fa-shopping-cart mr-3"></i> Cart
            </a>
            <a href="<%=request.getContextPath()%>/orders" class="flex items-center px-4 py-2 text-gray-300 hover:bg-gray-700 hover:text-white rounded-md">
                <i class="fas fa-receipt mr-3"></i> My Orders
            </a>
        </nav>
    </div>

    <!-- Login/Register/Logout at the bottom -->
    <div class="flex flex-col space-y-2">
        <% if (loggedUser != null) { %>
            <a href="<%=request.getContextPath()%>/user/logout" class="flex items-center px-4 py-2 text-gray-300 hover:bg-gray-700 hover:text-white rounded-md">
                <i class="fas fa-sign-out-alt mr-3"></i> Logout
            </a>
        <% } else { %>
            <a href="<%=request.getContextPath()%>/jsp/login.jsp" class="flex items-center px-4 py-2 text-gray-300 hover:bg-gray-700 hover:text-white rounded-md">
                <i class="fas fa-sign-in-alt mr-3"></i> Login
            </a>
            <a href="<%=request.getContextPath()%>/jsp/register.jsp" class="flex items-center px-4 py-2 text-gray-300 hover:bg-gray-700 hover:text-white rounded-md">
                <i class="fas fa-user-plus mr-3"></i> Register
            </a>
        <% } %>
    </div>
</aside>