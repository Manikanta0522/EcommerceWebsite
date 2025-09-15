<%@ page import="java.util.*,com.ecommerce.model.Product,com.ecommerce.dao.ProductDAO" %>
<%
    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <title>PremaloMart - Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #739EC9;
        }
        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
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
</head>
<body class="bg-gray-50 min-h-screen flex">
    <jsp:include page="/jsp/navbar.jsp" />
    <main class="flex-1 p-4 md:p-6 max-w-screen-xl mx-auto">
        <h1 class="text-3xl font-bold text-center text-gray-900 mb-6 mx-auto max-w-3xl">Welcome to PremaloMart</h1>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3 mx-auto">
            <%
                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
            %>
                <div class="product-card bg-white rounded-xl shadow-md overflow-hidden w-full max-w-xs">
                    <img src="<%= (p.getImageUrl() != null) ? p.getImageUrl() : "https://via.placeholder.com/220" %>"
                         alt="<%= p.getName() %>" class="w-full h-48 object-cover" />
                    <div class="p-4 text-center">
                        <h4 class="text-lg font-semibold text-gray-900 mb-2"><%= p.getName() %></h4>
                        <p class="text-md font-bold text-[#5682B1] mb-3">Rs <%= p.getPrice() %></p>
                        <form action="<%=request.getContextPath()%>/cart/add" method="post" class="flex items-center justify-center space-x-2">
                            <input type="hidden" name="productId" value="<%= p.getId() %>"/>
                            <input type="number" name="quantity" value="1" min="1" max="<%= p.getStock() %>"
                                   class="w-16 px-2 py-1 border border-[#739EC9] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#5682B1]"/>
                            <button type="submit" class="btn-primary px-3 py-2 rounded-lg hover:scale-105 transition-transform">
                                <i class="fas fa-cart-plus mr-1"></i> Add to Cart
                            </button>
                        </form>
                    </div>
                </div>
            <%
                    }
                } else {
            %>
                <div class="col-span-full text-center text-lg text-gray-900 my-10 mx-auto max-w-2xl">
                    <i class="fas fa-exclamation-circle mr-2"></i> No products available
                </div>
            <%
                }
            %>
        </div>
    </main>
</body>
</html>