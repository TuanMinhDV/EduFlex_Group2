/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import dto.FeatureDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Feature;
import model.Account;


public abstract class BaseRequiredAuthorizationController extends BaseAuthenticationController {

    private boolean isAuthorization(HttpServletRequest request, Account acc) {
        String accessUrl = request.getServletPath();
        //System.out.println(accessUrl);
        FeatureDAO dbFeature = new FeatureDAO();
        ArrayList<Feature> features = dbFeature.findByUsername(acc.getUsername());
        for (Feature feature : features) {
            //System.out.println(feature.getUrl());
            if (feature.getUrl().equals(accessUrl)) {
                return true;
            }
        }
        return false;
    }

    protected abstract void doAuthGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException;

    protected abstract void doAuthPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        if (isAuthorization(request, acc)) {
            doAuthGet(request, response, acc);
        } else {
            String message = "You do not have permission to access this page";
            request.setAttribute("message", message);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        if (isAuthorization(request, acc)) {
            doAuthPost(request, response, acc);
        } else {
            String message = "You do not have permission to access this page";
            request.setAttribute("message", message);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

}
