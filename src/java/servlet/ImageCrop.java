/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import static java.awt.image.ImageObserver.HEIGHT;
import static java.awt.image.ImageObserver.WIDTH;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

/**
 *
 * @author Orarmor
 */
public class ImageCrop extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ss = request.getSession();
        int t = Integer.parseInt(request.getParameter("t"));
        int l = Integer.parseInt(request.getParameter("l"));
        int w = Integer.parseInt(request.getParameter("w"));
        int h = Integer.parseInt(request.getParameter("h"));
        int width = (int) (Double.parseDouble(request.getParameter("width")));
        int heitgh = (int) (Double.parseDouble(request.getParameter("height")));
        System.out.println("i:" + request.getParameter("image"));
        System.out.println("j:" + request.getParameter("f"));
        String imagePath = getServletContext().getRealPath("/") + "\\img\\full_images\\" + request.getParameter("image");
        System.out.println("path" + imagePath);

        BufferedImage outImage = null;
        ImageIcon ii = new ImageIcon(imagePath);//path to image
        outImage = new BufferedImage(width, heitgh, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = (Graphics2D) outImage.createGraphics();
        g2d.addRenderingHints(new RenderingHints(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY));
        g2d.drawImage(ii.getImage(), 0, 0, width, heitgh, null);

        BufferedImage cropped = outImage.getSubimage(l, t, w, h);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ImageIO.write(cropped, request.getParameter("f"), out);

        ImageIO.write(cropped, request.getParameter("f"),
                new File(getServletContext().getRealPath("/") + "\\img\\crop_image\\" + request.getParameter("image"))); // save the file with crop dimensions
        Account ac = (Account) ss.getAttribute("ac");
        ac.setProfile_pic("img/crop_image/" + request.getParameter("image"));
        int res = Account.updatePic(ac);
        response.sendRedirect("profile");
//        ServletOutputStream wrt = response.getOutputStream();
//        wrt.write(out.toByteArray());
//        wrt.flush();
//        wrt.close();

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
