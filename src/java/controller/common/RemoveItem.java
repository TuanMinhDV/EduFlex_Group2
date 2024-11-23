package controller.common;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import controller.auth.BaseRequiredAuthorizationController;
import dto.CartDAO;
import dto.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.CartItem;
import model.OrderCourse;

@WebServlet(name = "RemoveItem", urlPatterns = {"/removeitem"})
public class RemoveItem extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        CartDAO cartdao = new CartDAO();
        RegistrationDAO reg = new RegistrationDAO();
        Cart cart = (Cart) session.getAttribute("cart");
        try {
            int course_id = Integer.parseInt(request.getParameter("course_id"));
            cart.removeItem(course_id);
            session.setAttribute("cart", cart);
            int remainingItems = cart.getItems().size();
            OrderCourse orderCourse = reg.getCoursebyId(course_id);
            double discount = orderCourse.getDiscount();
            double price = orderCourse.getPrice() * (1 - discount / 100);
            

            session.setAttribute("size", remainingItems);
            response.sendRedirect("cart.jsp");
        } catch (IOException | NumberFormatException e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
