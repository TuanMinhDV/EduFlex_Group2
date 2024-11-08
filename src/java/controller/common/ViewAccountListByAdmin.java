package controller.common;

import dto.AccountControllerByAdminDAO;
import java.io.IOException;
import java.util.ArrayList;
import model.AccountControlByAdmin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RoleControlByAdmin;

@WebServlet(name = "ViewAccountListByAdmin", urlPatterns = {"/viewaccountlistbyadmin"})
public class ViewAccountListByAdmin extends HttpServlet {

  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String searchName = request.getParameter("searchName");
    String role = request.getParameter("role");
    String statusParam = request.getParameter("status");

    int page = 1;
    int pageSize = 10;

    try {
        page = Integer.parseInt(request.getParameter("page"));
    } catch (NumberFormatException ignored) {}

    AccountControllerByAdminDAO dao = new AccountControllerByAdminDAO();
    ArrayList<AccountControlByAdmin> data;
    int totalAccounts = dao.getAccountCount(searchName, role, statusParam);
    int totalPages = (int) Math.ceil((double) totalAccounts / pageSize);

    // Xác định dữ liệu hiển thị dựa trên các điều kiện lọc
    if (searchName != null && !searchName.isEmpty()) {
        data = dao.searchAccountByName(searchName, page, pageSize);
    } else if ((role != null && !role.isEmpty()) || (statusParam != null && !statusParam.isEmpty())) {
        Boolean status = (statusParam != null && !statusParam.isEmpty()) ? "1".equals(statusParam) : null;
        data = dao.filterAccountByRoleAndStatus(role, status, page, pageSize);
    } else {
        data = dao.getListAccount(page, pageSize);
    }

    request.setAttribute("data", data);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("roles", dao.getRoles());
    request.setAttribute("searchName", searchName);
    request.setAttribute("role", role);
    request.setAttribute("status", statusParam);

    request.getRequestDispatcher("ViewAccountListByAdmin.jsp").forward(request, response);
}


    @Override
    public String getServletInfo() {
        return "Servlet for viewing account list by admin";
    }
}
