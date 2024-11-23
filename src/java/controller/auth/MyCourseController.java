
package controller.auth;

import dto.SliderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Learner_Course;
import model.Slider;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MyCourseController", urlPatterns = {"/mycourse"})
public class MyCourseController extends BaseRequiredAuthorizationController {

    @Override
    protected void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            
            HttpSession session = request.getSession();
            
            SliderDAO sdao = new SliderDAO();
            
            String learner_id = acc.getAccount_id() + "";
            List<Learner_Course> listLC = sdao.getAllMyCourse(learner_id);
            request.setAttribute("listLC", listLC);
            
            request.getRequestDispatcher("mycourse.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MyCourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
