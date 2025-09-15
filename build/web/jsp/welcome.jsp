<%@ page contentType="text/html;charset=UTF-8" import="com.ecommerce.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome - PremaloMart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .btn-primary {
            background: linear-gradient(to right, #5682B1, #739EC9);
            color: #FFFFFF;
        }
        .btn-primary:hover {
            background: linear-gradient(to right, #4A6F9A, #658AB2);
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <main class="bg-white p-8 rounded-2xl shadow-lg max-w-md w-full text-center">
        <div class="transform -translate-y-16">
            <div class="mx-auto bg-green-100 rounded-full h-24 w-24 flex items-center justify-center">
                <i class="fas fa-check text-green-600 text-4xl"></i>
            </div>
        </div>
        <div class="transform -translate-y-10">
            <h2 class="text-3xl font-bold text-gray-800 mb-4">
                Welcome, <%= ((User) session.getAttribute("user")).getFullname() %>!
            </h2>
            <p class="text-lg text-gray-600 mb-8">You have successfully logged in.</p>
            <a href="<%=request.getContextPath()%>/products"
               class="btn-primary w-full px-4 py-3 rounded-lg hover:scale-105 transition-transform inline-block text-lg font-semibold mb-4">
                <i class="fas fa-shopping-bag mr-2"></i> Continue Shopping
            </a>
            <a href="<%=request.getContextPath()%>/user/logout"
               class="text-gray-500 hover:text-gray-700 transition-colors">
                or Logout
            </a>
        </div>
    </main>
</body>
</html>
