<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success - PremaloMart</title>
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
    <script>
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('sidebar-hidden');
        }
    </script>
</head>
<body class="bg-gray-50 dark:bg-000000 min-h-screen flex">
    <jsp:include page="navbar.jsp" />
    <main class="flex-1 p-6 md:ml-64">
        <button class="md:hidden fixed top-4 right-4 z-50 text-000000 dark:text-ffe8db focus:outline-none" onclick="toggleSidebar()">
            <i class="fas fa-bars text-2xl"></i>
        </button>
        <div class="max-w-lg mx-auto mt-12">
            <div class="bg-white dark:bg-000000 rounded-xl shadow-md p-8 text-center transform transition-transform hover:scale-102">
                <h2 class="text-3xl font-bold text-5682b1 dark:text-739ec9 mb-6 animate-fade-in">
                    <i class="fas fa-check-circle mr-2"></i> Order Placed Successfully!
                </h2>
                <p class="text-lg text-000000 dark:text-ffe8db mb-3">Your order ID is <b><%= request.getAttribute("orderId") %></b>.</p>
                <p class="text-lg text-000000 dark:text-ffe8db mb-3">Total Amount: ₹<b><%= request.getAttribute("total") %></b></p>
                <p class="text-lg text-000000 dark:text-ffe8db mb-6">Payment Method: <b><%= request.getAttribute("paymentMethod") %></b></p>
                <a href="<%= request.getContextPath() %>/products"
                   class="btn-primary px-6 py-3 rounded-lg hover:scale-105 transition-transform inline-flex items-center">
                    <i class="fas fa-shopping-bag mr-2"></i> Continue Shopping
                </a>
            </div>
        </div>
    </main>
</body>
</html>