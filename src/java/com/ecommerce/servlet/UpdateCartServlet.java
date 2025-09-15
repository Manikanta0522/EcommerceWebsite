package com.ecommerce.servlet;

import com.ecommerce.dao.CartDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class UpdateCartServlet extends HttpServlet {
    private final CartDAO cartDAO = new CartDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int qty = Integer.parseInt(request.getParameter("quantity"));

            if (qty > 0) {
                cartDAO.updateItemQuantity(itemId, qty);
            } else {
                // Quantities of 0 or less are ignored. A separate remove button is better for deletion.
            }
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (NumberFormatException e) {
            // Handle cases where itemId or quantity are not valid integers
            response.sendRedirect(request.getContextPath() + "/cart?error=InvalidInput");
        } catch (SQLException e) {
            throw new ServletException("Database error while updating cart", e);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
