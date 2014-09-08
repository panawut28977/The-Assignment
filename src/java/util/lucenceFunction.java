/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import Model.TestDriver;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.lucene.analysis.th.ThaiAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

/**
 *
 * @author Orarmor
 */
public class lucenceFunction {
    public static void settingIndexer(String indexPath,String filname,Long course_id,int am_id,int st_am_id,int safv_id){
        Directory directory = null;
        IndexWriter writer = null;
        try {
            String studentAmPath = indexPath;
            directory = FSDirectory.open(new File(studentAmPath + course_id + "\\" + am_id));
            IndexWriterConfig iw = new IndexWriterConfig(Version.LUCENE_47, new ThaiAnalyzer(Version.LUCENE_47));
            writer = new IndexWriter(directory, iw.setRAMBufferSizeMB(iw.getRAMBufferSizeMB()));
            String filename = filname;
            String fileExtension = filename.substring(filename.lastIndexOf(".") + 1);
            String st = "";
            if (fileExtension.equalsIgnoreCase("docx")) {
                st = DocumentFunction.readDocxFile(studentAmPath+filename);
            } else if (fileExtension.equalsIgnoreCase("doc")) {
                st = DocumentFunction.readDocFile(studentAmPath+filename);
            } else if (fileExtension.equalsIgnoreCase("xls")) {
                st = DocumentFunction.readXlsFile(studentAmPath+filename);
            } else if (fileExtension.equalsIgnoreCase("xlsx")) {
                st = DocumentFunction.readXlsxFile(studentAmPath+filename);
            } else if (fileExtension.equalsIgnoreCase("pdf")) {
                st = DocumentFunction.readPdfFile(studentAmPath+filename);
            }
//            System.out.println(saf.getSt_am_id()+"--\n"+st);
            Document doc = new Document();
            Field f1 = new Field("student_assignment", st, Field.Store.YES, Field.Index.ANALYZED);
            Field f2 = new Field("st_am_id", st_am_id+"", Field.Store.YES, Field.Index.ANALYZED);
            Field f3 = new Field("safv_id", safv_id+"", Field.Store.YES, Field.Index.ANALYZED);
            doc.add(f1);
            doc.add(f2);
            doc.add(f3);
            writer.addDocument(doc);
            writer.close();

        } catch (IOException ex) {
            Logger.getLogger(TestDriver.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
