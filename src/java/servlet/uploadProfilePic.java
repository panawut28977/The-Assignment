/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.MyFileRenamePolicy;

/**
 *
 * @author Orarmor
 */
public class uploadProfilePic extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        File f = new File(getServletContext().getRealPath("/") + "/img/full_images");
        MyFileRenamePolicy mf = new MyFileRenamePolicy();
        MultipartRequest m = new MultipartRequest(request, f.getPath(), (5 * 1024 * 1024), "UTF-8", mf);
        String imagePath = getServletContext().getRealPath("/")+"/img/full_images/" + m.getFilesystemName("inputpic");
        BufferedImage bimg = ImageIO.read(new File(imagePath));
        int width = bimg.getWidth();
        int height = bimg.getHeight();
//        Account ac = (Account)ss.getAttribute("ac");
//        ac.setProfile_pic("full_images/"+m.getFilesystemName("inputpic"));
//        int res  = Account.updatePic(ac);
//        System.out.println(res);
        Gson gson = new GsonBuilder().create();
        Map<String, String> data = new HashMap<>();
//        data.put("result", res+"");
        data.put("newPicture",  m.getFilesystemName("inputpic"));
        data.put("width", width+"");
        data.put("height", height+"");
        System.out.println(data);
//        System.out.println(ac.getProfile_pic());
        out.write(gson.toJson(data));
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
