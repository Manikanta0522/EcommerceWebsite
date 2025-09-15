<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - PremaloMart</title>
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
        .input-group {
            position: relative;
        }
        .input-group input,
        .input-group textarea,
        .input-group select {
            transition: all 0.3s ease;
        }
        .input-group label {
            position: absolute;
            top: 0.75rem;
            left: 1rem;
            color: #739EC9;
            transition: all 0.3s ease;
            pointer-events: none;
        }
        .input-group input:focus + label,
        .input-group textarea:focus + label,
        .input-group select:focus + label,
        .input-group input:not(:placeholder-shown) + label,
        .input-group textarea:not(:placeholder-shown) + label,
        .input-group select:not(:placeholder-shown) + label {
            top: -0.75rem;
            left: 0.75rem;
            font-size: 0.75rem;
            color: #5682B1;
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
            <div class="bg-white dark:bg-000000 rounded-xl shadow-md p-8 transform transition-transform hover:scale-102">
                <h2 class="text-3xl font-bold text-center text-000000 dark:text-ffe8db mb-6 animate-fade-in">
                    <i class="fas fa-shopping-cart mr-2"></i> Checkout
                </h2>
                <form action="<%=request.getContextPath()%>/checkout" method="post">
                    <div class="mb-6 input-group">
                        <input type="text" name="fullname" id="fullname" class="w-full px-4 py-3 border border-739ec9 dark:border-739ec9 rounded-lg focus:outline-none focus:ring-2 focus:ring-5682b1 dark:bg-000000 dark:text-ffe8db" placeholder=" " required />
                        <label for="fullname"><i class="fas fa-user mr-2"></i> Full Name</label>
                    </div>
                    <div class="mb-6 input-group">
                        <textarea name="address" id="address" class="w-full px-4 py-3 border border-739ec9 dark:border-739ec9 rounded-lg focus:outline-none focus:ring-2 focus:ring-5682b1 dark:bg-000000 dark:text-ffe8db" rows="3" placeholder=" " required></textarea>
                        <label for="address"><i class="fas fa-map-marker-alt mr-2"></i> Address</label>
                    </div>
                    <div class="mb-6 input-group">
                        <input type="text" name="phone" id="phone" class="w-full px-4 py-3 border border-739ec9 dark:border-739ec9 rounded-lg focus:outline-none focus:ring-2 focus:ring-5682b1 dark:bg-000000 dark:text-ffe8db" placeholder=" " required />
                        <label for="phone"><i class="fas fa-phone mr-2"></i> Phone Number</label>
                    </div>
                    <div class="mb-6 input-group">
                        <select name="paymentMethod" id="paymentMethod" class="w-full px-4 py-3 border border-739ec9 dark:border-739ec9 rounded-lg focus:outline-none focus:ring-2 focus:ring-5682b1 dark:bg-000000 dark:text-ffe8db" required>
                            <option value="COD">Cash on Delivery</option>
                            <option value="Card">Credit/Debit Card</option>
                            <option value="UPI">UPI</option>
                        </select>
                        <label for="paymentMethod"><i class="fas fa-credit-card mr-2"></i> Payment Method</label>
                    </div>
                    <button type="submit" class="w-full btn-primary py-3 rounded-lg hover:scale-105 transition-transform">
                        <i class="fas fa-check-circle mr-2"></i> Place Order
                    </button>
                </form>
            </div>
        </div>
    </main>
</body>
</html>