/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Assignment;
import Model.StAmFileList;
import Model.StAssignmentFile;
import Model.TestDriver;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.th.ThaiAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.TopFieldCollector;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.TokenSources;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import util.DocumentFunction;

/**
 *
 * @author Orarmor
 */
public class Checkcopy extends HttpServlet {

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
        Assignment a = (Assignment) ss.getAttribute("curAm");
        int safv_id = Integer.parseInt(request.getParameter("safv_id"));
        String studentAmPath = getServletContext().getRealPath("/") + "\\file\\student_assignment_file\\";
        if (a.getAss_type().equalsIgnoreCase("file")) {
            StAssignmentFile sa = (StAssignmentFile) ss.getAttribute("sa");
            StAmFileList f = StAmFileList.getSafvByListIdSafv(safv_id, sa.getList_id());
            String filename = f.getPath_file();
            String fileExtension = filename.substring(filename.lastIndexOf(".") + 1);
            String keyword = "";
            if (fileExtension.equalsIgnoreCase("docx")) {
                keyword = DocumentFunction.readDocxFile(studentAmPath + filename);
            } else if (fileExtension.equalsIgnoreCase("doc")) {
                keyword = DocumentFunction.readDocFile(studentAmPath + filename);
            } else if (fileExtension.equalsIgnoreCase("xls")) {
                keyword = DocumentFunction.readXlsFile(studentAmPath + filename);
            } else if (fileExtension.equalsIgnoreCase("xlsx")) {
                keyword = DocumentFunction.readXlsxFile(studentAmPath + filename);
            } else if (fileExtension.equalsIgnoreCase("pdf")) {
                keyword = DocumentFunction.readPdfFile(studentAmPath + filename);
            }
            System.out.println(keyword);
            System.out.println("----------------------search...");
            Directory directory = null;
            IndexReader indexReader;
            try {
                directory = FSDirectory.open(new File(studentAmPath+"\\"+a.getCourse().getCourse_id()+"\\"+sa.getAm_id()));
                indexReader = DirectoryReader.open(directory);
                IndexSearcher searcher = new IndexSearcher(indexReader);
                QueryParser parser = new QueryParser(Version.LUCENE_47, "student_assignment", new ThaiAnalyzer(Version.LUCENE_47));
                Query query = parser.parse(QueryParser.escape(keyword));

                int hitsPerPage = 10;
                Sort sort = new Sort(new SortField[]{SortField.FIELD_SCORE, new SortField("student_assignment", SortField.Type.STRING)});
                TopFieldCollector topField = TopFieldCollector.create(sort, hitsPerPage, true, true, true, false);
                searcher.search(query, topField);
                TopDocs docs = topField.topDocs();
                SimpleHTMLFormatter htmlFormatter = new SimpleHTMLFormatter("<font color=red><b>", "<b></font>");
                Highlighter highlighter = new Highlighter(htmlFormatter, new QueryScorer(query));
                for (int i = 0; i < docs.totalHits; i++) {
                    int id = docs.scoreDocs[i].doc;
                    Document doc = searcher.doc(id);
                    String text = doc.get("student_assignment");
                    TokenStream tokenStream = TokenSources.getAnyTokenStream(searcher.getIndexReader(), id, "student_assignment", new ThaiAnalyzer(Version.LUCENE_47));

                    String[] hltext = highlighter.getBestFragments(tokenStream, text, hitsPerPage);
                    for (String string : hltext) {
                        System.out.println(string.toString());
                    }
                    System.out.println("-----------");
                }
            } catch (IOException ex) {
                Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvalidTokenOffsetsException ex) {
                Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
