package controller.common;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;

@WebServlet(name = "RemoveItem", urlPatterns = {"/removeitem"})
public class RemoveItem extends HttpServlet {

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession(true);
    Cart cart = (Cart) session.getAttribute("cart");
    try {
        int subject_id = Integer.parseInt(request.getParameter("subject_id"));
        cart.removeItem(subject_id);

        session.setAttribute("cart", cart);

        int remainingItems = cart.getItems().size(); 
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

}
