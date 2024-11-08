package controller.common;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dto.AccountControllerByAdminDAO;

@WebServlet(name = "ChangeRoleAccountByAdmin", urlPatterns = {"/changeroleaccountbyadmin"})
public class ChangeRoleAccountByAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        int newRoleId = Integer.parseInt(request.getParameter("newRole"));

        AccountControllerByAdminDAO dao = new AccountControllerByAdminDAO();
        boolean success = dao.updateAccountRole(accountId, newRoleId);

        if (success) {
            request.setAttribute("message", "Role updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update role.");
        }
       

        // Redirect to the account list view
        response.sendRedirect("viewaccountlistbyadmin?success=" + success);
    }
}
