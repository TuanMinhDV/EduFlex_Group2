package controller.common;

import dto.AccountControllerByAdminDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.AccountControlByAdmin;
import utils.EmailUtilsByAdmin;

@WebServlet(name="ChangeAccountStatusServlet", urlPatterns={"/changeAccountStatus"})
public class ChangeAccountStatusServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeAccountStatusServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeAccountStatusServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    String accountIdParam = request.getParameter("accountId");
    String currentStatusParam = request.getParameter("currentStatus");
    String sendEmailParam = request.getParameter("sendEmail"); // Receive email sending option
    
    int accountId = Integer.parseInt(accountIdParam);
    boolean currentStatus = Boolean.parseBoolean(currentStatusParam);
    boolean sendEmail = "true".equals(sendEmailParam); // Check if email should be sent
    
    // Toggle status
    boolean newStatus = !currentStatus;
    
    // Update status in the database
    try {
        AccountControllerByAdminDAO accountDao = new AccountControllerByAdminDAO();
        accountDao.updateAccountStatus(accountId, newStatus);
        
        // If user chooses to send an email
        if (sendEmail) {
            AccountControlByAdmin account = accountDao.getAccountById(accountId);
            String subject = "Account Status Change Notification";
            String body = "Hello " + account.getFullname() + ",\n\n"
                        + "The status of your account has been updated.\n"
                        + "Account information:\n"
                        + "Username: " + account.getUsername() + "\n"
                        + "Email: " + account.getEmail() + "\n"
                        + "Phone Number: " + account.getPhone() + "\n"
                        + "Role: " + account.getRoleName() + "\n"
                        + "Status: " + (newStatus ? "Active" : "Blocked") + "\n\n"
                        + "Thank you!";
            
            EmailUtilsByAdmin.sendEmail(account.getEmail(), subject, body);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    response.sendRedirect("viewaccountlistbyadmin?success=true");
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
