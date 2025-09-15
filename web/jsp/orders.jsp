<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders - PremaloMart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .table-row {
            transition: background-color 0.3s ease;
        }
        .table-row:hover {
            background-color: #FFE8DB;
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
        <h2 class="text-3xl font-bold text-center mb-8 text-000000 dark:text-ffe8db animate-fade-in">
            <i class="fas fa-box-open mr-2"></i> My Orders
        </h2>
        <div class="bg-white dark:bg-000000 rounded-xl shadow-md overflow-hidden">
            <table class="w-full divide-y divide-739ec9 dark:divide-739ec9">
                <thead class="bg-5682b1">
                    <tr>
                        <th class="px-6 py-4 text-left text-white font-semibold">Order ID</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Total</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Date</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-739ec9 dark:divide-739ec9">
                    <%
                        List<Map<String,Object>> orders = (List<Map<String,Object>>) request.getAttribute("orders");
                        if (orders != null && !orders.isEmpty()) {
                            for (Map<String,Object> o : orders) {
                    %>
                    <tr class="table-row">
                        <td class="px-6 py-4 text-000000 dark:text-ffe8db"><%= o.get("id") %></td>
                        <td class="px-6 py-4 text-000000 dark:text-ffe8db">₹<%= o.get("total") %></td>
                        <td class="px-6 py-4 text-000000 dark:text-ffe8db"><%= o.get("created_at") %></td>
                    </tr>
                    <% 
                            }
                        } else { 
                    %>
                    <tr><td colspan="3" class="px-6 py-4 text-center text-000000 dark:text-ffe8db">No orders found</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>