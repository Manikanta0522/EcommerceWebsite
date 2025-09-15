<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.ecommerce.model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - PremaloMart</title>
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
        .btn-primary {
            background: linear-gradient(to right, #5682B1, #739EC9);
            color: #FFFFFF;
        }
        .btn-primary:hover {
            background: linear-gradient(to right, #4A6F9A, #658AB2);
        }
        .btn-danger {
            background-color: #000000;
            color: #FFE8DB;
        }
        .btn-danger:hover {
            background-color: #333333;
        }
    </style>
    <script>
        function confirmRemove() {
            return confirm("Are you sure you want to remove this item from your cart?");
        }
    </script>
</head>
<body class="bg-gray-50 dark:bg-000000 min-h-screen flex">
    <jsp:include page="navbar.jsp" />
    <main class="flex-1 p-6 md:ml-64">
        <h2 class="text-3xl font-bold text-center mb-8 text-000000 dark:text-ffe8db animate-fade-in">
            <i class="fas fa-shopping-cart mr-2"></i> Your Shopping Cart
        </h2>
        <div class="bg-white dark:bg-000000 rounded-xl shadow-md overflow-hidden">
            <table class="w-full divide-y divide-739ec9 dark:divide-739ec9">
                <thead class="bg-5682b1">
                    <tr>
                        <th class="px-6 py-4 text-left text-white font-semibold">Image</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Product</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Price</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Quantity</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Total</th>
                        <th class="px-6 py-4 text-left text-white font-semibold">Action</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-739ec9 dark:divide-739ec9">
                    <%
                        List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
                        double grandTotal = 0;
                        if (cart != null && !cart.isEmpty()) {
                            for (CartItem ci : cart) {
                                double subtotal = ci.getQuantity() * ci.getProduct().getPrice();
                                grandTotal += subtotal;
                    %>
                    <tr class="table-row">
                        <td class="px-6 py-4">
                            <img src="<%= (ci.getProduct().getImageUrl() != null) ? request.getContextPath() + "/" + ci.getProduct().getImageUrl() : "https://via.placeholder.com/220" %>"
                                 alt="<%= ci.getProduct().getName() %>" class="w-20 h-20 object-cover rounded-lg transform transition-transform hover:scale-103"/>
                        </td>
                        <td class="px-6 py-4 text-000000 dark:text-ffe8db"><%= ci.getProduct().getName() %></td>
                        <td class="px-6 py-4 text-000000 dark:text-ffe8db">₹<%= ci.getProduct().getPrice() %></td>
                        <td class="px-6 py-4">
                            <form action="<%=request.getContextPath()%>/cart/update" method="post" class="flex items-center space-x-3">
                                <input type="hidden" name="itemId" value="<%= ci.getId() %>" />
                                <input type="number" name="quantity" value="<%= ci.getQuantity() %>" min="1"
                                       class="w-16 px-2 py-1 border border-739ec9 dark:border-739ec9 rounded-lg focus:outline-none focus:ring-2 focus:ring-5682b1 dark:bg-000000 dark:text-ffe8db" />
                                <button type="submit"
                                        class="btn-primary px-4 py-2 rounded-lg hover:scale-105 transition-transform">
                                    <i class="fas fa-sync-alt"></i> Update
                                </button>
                            </form>
                        </td>
                        <td class="px-6 py-4 text-000000 dark:text-ffe8db">₹<%= subtotal %></td>
                        <td class="px-6 py-4">
                            <form action="<%=request.getContextPath()%>/cart/remove" method="post" onsubmit="return confirmRemove();">
                                <input type="hidden" name="itemId" value="<%= ci.getId() %>" />
                                <button type="submit"
                                        class="btn-danger px-4 py-2 rounded-lg hover:scale-105 transition-transform">
                                    <i class="fas fa-trash-alt mr-2"></i> Remove
                                </button>
                            </form>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr><td colspan="6" class="px-6 py-4 text-center text-000000 dark:text-ffe8db">Your cart is empty.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <h3 class="text-2xl font-bold text-center my-8 text-5682b1 dark:text-739ec9">Grand Total: ₹<%= grandTotal %></h3>
        <% if (grandTotal > 0) { %>
        <div class="text-center">
            <form action="<%=request.getContextPath()%>/checkout" method="post">
                <button type="submit"
                        class="btn-primary px-6 py-3 rounded-lg hover:scale-105 transition-transform">
                    <i class="fas fa-check-circle mr-2"></i> Proceed to Checkout
                </button>
            </form>
        </div>
        <% } %>
    </main>
</body>
</html>