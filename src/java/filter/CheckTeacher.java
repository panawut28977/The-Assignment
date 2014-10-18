/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import Model.Account;
import Model.AccountCourse;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class CheckTeacher implements Filter {

    private FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession ss = req.getSession();
        Account a = (Account) ss.getAttribute("ac");
//        String accCourse = AccountCourse.getAccountRole(a.getAcc_id(), course_id);
//        if (!accCourse.equalsIgnoreCase("TH")) {
//            req.setAttribute("msg", 12);
//            req.getRequestDispatcher("/inform.jsp").forward(request, response);
//        } else {
//            chain.doFilter(request, response);
//        }
    }

    @Override
    public void destroy() {

    }
}
