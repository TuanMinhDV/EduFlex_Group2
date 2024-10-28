package controller.auth;

import dto.RegistrationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.CartItem;
import model.OrderCourse;

@WebServlet(name = "BuyCourseController", urlPatterns = {"/buycourse"})
public class BuyCourseController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            boolean productExisted = false;
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            String tcourse_id = request.getParameter("course_id");
            int course_id;

            try {
                course_id = Integer.parseInt(tcourse_id);

                RegistrationDAO reg = new RegistrationDAO();
                OrderCourse od = reg.getCoursebyId(course_id);
                int category_id = od.getCategory_id();
                double discount = od.getDiscount();
                double price = od.getPrice() * (1 - discount / 100);
                CartItem t = new CartItem(od, price);
                t.setCategory_id(category_id);

                for (CartItem existingItem : cart.getItems()) {
                    if (existingItem.getOrderCourse().getCourse_id() == t.getOrderCourse().getCourse_id()) {
                        productExisted = true;
                        break;
                    }
                }
                if (!productExisted) {
                    cart.addItem(t);
                }
            } catch (NumberFormatException e) {
            }
            if (productExisted) {
                request.setAttribute("productExistsMessage", "Subject already in the cart!");

            }

            List<CartItem> list = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("size", list.size());
            //request.getRequestDispatcher("courselist").forward(request, response);
            response.sendRedirect("cart.jsp");
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
