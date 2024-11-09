package paypal;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import dto.RegistrationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.CartItem;
import model.OrderDetail;

import model.OrderCourse;


@WebServlet(name = "ReviewPayment", urlPatterns = {"/review_payment"})
public class ReviewPayment extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ReviewPayment() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        RegistrationDAO registration = new RegistrationDAO();
        HttpSession session = request.getSession();
        
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        double subtotal = 0.0;
        for (CartItem item : cart.getItems()) {
            subtotal += item.getPrice();
        }
        //double total = subtotal;
        //List<OrderCourse> list = registration.getAll();
        Account acc = (Account) session.getAttribute("account");
        
        registration.addOrderCourse(acc, cart, subtotal);
        LocalDate curDate = LocalDate.now(); 
        String date = curDate.toString();
        request.setAttribute("paymentDate", date);
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.getPaymentDetails(paymentId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            String url = "review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
            request.getRequestDispatcher(url).forward(request, response);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            Logger.getLogger(ReviewPayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
