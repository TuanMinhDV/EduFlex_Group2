package paypal;

import com.paypal.base.rest.PayPalRESTException;
import controller.auth.BaseRequiredAuthorizationController;
import dto.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.CartItem;
import model.OrderDetail;
import model.OrderCourse;
import paypal.PaymentServices;

@WebServlet(name = "AuthorizePayment", urlPatterns = {"/authorize_payment"})
public class AuthorizePayment extends BaseRequiredAuthorizationController {

    private static final long serialVersionUID = 1L;

    public AuthorizePayment() {
    }

    @Override
    protected void doAuthGet(HttpServletRequest req, HttpServletResponse resp, Account acc) throws ServletException, IOException {
  }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
            response.sendRedirect("courselisthome");
        } else {
            try {
                double subtotal = 0.0;
                for (CartItem item : cart.getItems()) {
                    subtotal += item.getPrice();
                }
                double total = subtotal;
                OrderDetail orderDetail = new OrderDetail(String.format("%.2f", subtotal),
                        String.format("%.2f", total));
                PaymentServices paymentServices = new PaymentServices();
                String approvalLink = paymentServices.authorizePayment(orderDetail);
                response.sendRedirect(approvalLink);
            } catch (PayPalRESTException ex) {
                request.setAttribute("errorMessage", ex.getMessage());
                ex.printStackTrace();
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
    }

}
