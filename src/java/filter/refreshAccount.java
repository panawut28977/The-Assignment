/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import Model.Account;
import Model.Assignment;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
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
 * @author longd29
 */
public class refreshAccount implements Filter {

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
        a = Account.login(a.getEmail(), a.getPassword());
        ss.setAttribute("ac", a);
        List<Assignment> amList = a.getAssignment();
        String st = "";
        Integer late = 0, hurry = 0, ontime = 0, sent = 0;
        for (Assignment assignment : amList) {
            st = Assignment.remainingTimeforSend(assignment, a.getAcc_id());
            if (st.equalsIgnoreCase("sent")) {
                sent++;
            } else if (st.equalsIgnoreCase("ontime")) {
                ontime++;
            } else if (st.equalsIgnoreCase("hurryup")) {
                hurry++;
            } else {
                late++;
            }
        }
        ss.setAttribute("late", late);
        ss.setAttribute("hurry", hurry);
        ss.setAttribute("ontime", ontime);
        ss.setAttribute("sent", sent);
        ss.setAttribute("rf", 1);
        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }

}
