package controller.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import dto.OrderControllerByAdminDAO;
import model.OrderDetailControlByAdmin;

@WebServlet(name="ViewOrderDetailByAdmin", urlPatterns={"/ViewOrderDetailByAdmin"})
public class ViewOrderDetailByAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Parse the orderId parameter from the request
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // Create an instance of the DAO to access the database
            OrderControllerByAdminDAO orderDao = new OrderControllerByAdminDAO();
            
            // Fetch the order details by orderId
            OrderDetailControlByAdmin orderDetail = orderDao.getOrderDetail(orderId);

            // Check if orderDetail is not null
            if (orderDetail != null) {
                // Convert OrderDetailControlByAdmin object to a Map
                Map<String, Object> orderDetailMap = new HashMap<>();
                orderDetailMap.put("Order ID", orderDetail.getOrderId());
                orderDetailMap.put("Account ID", orderDetail.getAccountId());
                orderDetailMap.put("Order Date", orderDetail.getOrderDate());
                orderDetailMap.put("Total Money", orderDetail.getTotalMoney());
                orderDetailMap.put("Course ID", orderDetail.getCourseId());
                orderDetailMap.put("Course Name", orderDetail.getCourseName());
                orderDetailMap.put("Username", orderDetail.getUsername());
                orderDetailMap.put("Full Name", orderDetail.getFullname());
                orderDetailMap.put("Role Name", orderDetail.getRoleName());
                orderDetailMap.put("Price", orderDetail.getPrice());

                // Set the orderDetailMap attribute to pass it to the JSP
                request.setAttribute("orderDetailMap", orderDetailMap);
            } else {
                // If no order found, set an error message
                request.setAttribute("errorMessage", "Order not found for the provided ID");
            }

            // Forward the request to the orderDetail.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("ViewOrderDetailByAdmin.jsp");
            dispatcher.forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Displays order details for admin based on orderId";
    }
}
