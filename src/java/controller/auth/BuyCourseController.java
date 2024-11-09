package controller.auth;

import dto.CartDAO;
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
        CartDAO dao = new CartDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            boolean productExisted = false;
            int accountId = acc.getAccount_id();
            List<CartItem> cart_item_list = dao.loadCart(accountId);
            Cart cart = new Cart(cart_item_list);
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }

            String tcourse_id = request.getParameter("course_id");
            int course_id = Integer.parseInt(tcourse_id);

            try {
                RegistrationDAO reg = new RegistrationDAO();
                CartDAO cartdao = new CartDAO();
                OrderCourse orderCourse = reg.getCoursebyId(course_id);
                double discount = orderCourse.getDiscount();
                double price = orderCourse.getPrice() * (1 - discount / 100);
                //Tạo cart Item mới
                CartItem t = new CartItem(orderCourse, price, accountId);

                for (CartItem existingItem : cart.getItems()) {
                    if (existingItem.getOrderCourse().getCourse_id() == t.getOrderCourse().getCourse_id()) {
                        productExisted = true;
                        break;
                    }

                }
                
                if (!productExisted) {
                    cart.addItem(t);
                    cartdao.addCartItem(t);
                }
                if (productExisted) {
                    request.setAttribute("productExistsMessage", "Subject already in the cart!");
                }
            } catch (NumberFormatException e) {
            }

            List<CartItem> list = cart.getItemsByAccId(accountId);
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
