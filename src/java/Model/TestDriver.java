/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Orarmor
 */
public class TestDriver {

    public static void main(String[] args) {
        //-- Test Account method
//        Account a = new Account();
//        a.setAccount_type("ST");
//        a.setEmail("Orarmor");
//        a.setFirstname("Orarmor");
//        a.setLastname("arm");
//        a.setPassword("arm");
//        a.setProfile_pic("test");
//        a.setAcc_id(2);
//        Account.edit(a);
//        
//        Account.register(a);
//        System.out.println(Account.getAccountByID(2));

        //----- Test join course
//        Course c = new Course();
//        c.setCourse_id(1);
//        AccountCourse ac = new AccountCourse();
//        ac.setCouse(c);
//        ac.setRole("TH");
//        ac.setStatus("waiting");
//        
//        AccountCourse.joinCourse(ac, 4);        
//        AccountCourse.joinCourse(ac, 2);
//        AccountCourse.joinCourse(ac, 1);
        //---- Test approve method
        //  AccountCourse.approve(5, 1);
        //---- Test disapprove method
//        AccountCourse.disapprove(1,1);
        //---- Test change role 
//        AccountCourse.changeRole(5, 1,1);
        //---- Test check owner
//        Course.generateCode();
//        //---- Add Announcement
//        Course c = Course.getCourseByID(1);
//        Account acc = Account.getAccountByID(1);
//        Announcement a = new Announcement();
//        a.setAn_acc(acc);
//        a.setCourse(c);
//        a.setContent("Test content Test content Test content Test content");
//        a.setTitle("Test header");
//        Announcement.add(a);
//        //--- get Announcement by course or acc id
//        System.out.println(Announcement.viewAnnByAccID(1));
//        System.out.println(Announcement.viewAnnByCourse(1));
//        
        //--- remove Announcement
        //System.out.println(Announcement.remove(2));
        //--update Announcement
//        Course c = Course.getCourseByID(1);
//        Account acc = Account.getAccountByID(1);
//        Announcement a = new Announcement();
//        a.setAn_id(1);
//        a.setAn_acc(acc);setLastname
//        a.setCourse(c);
//        a.setContent("update content");
//        a.setTitle("Test header");
//        System.out.println(Announcement.update(a));
        //-- craete assignment info
//        Assignment am = new Assignment();
//        am.setAss_extension("docx");
//        am.setAss_type("file");
//        am.setCourse_id(3);
//        Date d = new Date();
//        am.setDescription(" nsnddda  asdfsfasdfsaf ");
//        am.setDue_date(d);
//        am.setName("orarmor work 4");
//        am.setTotal_member(1);
//        Assignment.createAmInfo(am);
//        
        //          
        //getAmByAccID
//        System.out.println(Assignment.getAmByAccID(1));
//          
        //-- delete am
//        Assignment.deleteAm(4);
        //
        //getAmByCourseID
//        System.out.println(Assignment.getAmByCourseID(1));
        //
        //getAmByAmID
//        System.out.println(Assignment.getAmByAmID(1));
        //
        //getAmByAccID
//        System.out.println(Assignment.getAmByAccID(4));
        //        
        //isSend
        //System.out.println(Assignment.isSend(1,2));
        //
//        Assignment a = new Assignment();
//        a.setAm_id(1);
//        a.setAss_type("file");
//        System.out.println(Assignment.remainingTimeforSend(a, 1));
        //
        //Message send
//        Message m =  new Message();
//        m.setSource_acc_id(Account.getAccountByID(1));
//        m.setDest_acc_id(Account.getAccountByID(2));
//        m.setMessage("eeeerererer");
//        Message.send(m);
        //
        //Get Message 
//        System.out.println(Message.getMessageBetweenSourceAndDest(1, 2));
        //
        //Test get data of unknow question type
//        Question o = new Explain("qestionnnn?");
//        Explain ex = (Explain)o;
//        System.out.println(ex.getQ_text());
//        Question f = new Explain();
//        System.out.println(f.getQ_end_index());
        //
        //Test add Question
//        FillBlank
//        FillBlank fb = new FillBlank();
//        fb.setQ_id(1);
//        fb.setAss_id(1);
//        fb.setQ_no(2);
//        fb.setInstruction("จงเติมคำในช่องว่างระหว่างข้อ ... - ...");
//        fb.setQ_type("fillBlank");
//        fb.setAnswer("orarmorarm");
//        fb.setQ_text("orarmorarm");
//        fb.setQ_start_index(2);
//        fb.setQ_end_index(6);
//        fb.setScore(10);
//        fb.setQ_order(2);
//        Question.add(fb);
        //
        //MatchWord
//        MatchWord mw = new MatchWord();
//        mw.setQ_id(2);
//        mw.setAss_id(1);
//        mw.setQ_no(1);
//        mw.setInstruction("Part 2 มีทั้งหมด 20 คะแนน แบ่งเป็น ....");
//        mw.setQ_type("matchWord");
//        mw.setQ_title("จงจับคู่คำที่มีความหมายต่างกัน");
//        mw.setQ_text("good");
//        mw.setQ_answer("bad");
//        mw.setQ_score(0);
//        Question.add(mw);
        //
        //MultipleChoice
//        MultipleChoice mc = new MultipleChoice();
//        mc.setQ_id(3);
//        mc.setAss_id(2);
//        mc.setQ_no(1);
//        mc.setInstruction("Part 3 ข้อสอบกากบาท มีทั้งหมด 40 ข้อ ....");
//        mc.setQ_type("multipleChoice");
//        mc.setQ_text("ข้อใดต่อไปนี้ถูกต้องที่สุด");
//        mc.setQ_category("tf");
//        mc.setQ_choice_list("true/false");
//        mc.setQ_answer_list("true");
//        mc.setQ_score(0);
//        Question.add(mc);
        //
        //Explain
//        Explain exp = new Explain();
//        exp.setQ_id(4);
//        exp.setAss_id(2);
//        exp.setQ_no(2);
//        exp.setInstruction("Part 1 ข้อสอบ มีทั้งหมด 40 ข้อ ....");
//        exp.setQ_type("explain");
//        exp.setQ_text("จงอธิบาย .... ต่อไปนี้");
//        exp.setQ_keyword_check("w er  po opo kl klklk lklkl k lk");
//        Question.add(exp);
        //
        //Add list of question
//        MultipleChoice mc = new MultipleChoice();
//        mc.setQ_id(5);
//        mc.setAss_id(2);
//        mc.setQ_no(3);
//        mc.setInstruction("Part 1 ข้อสอบ มีทั้งหมด 40 ข้อ ....");
//        mc.setQ_type("multipleChoice");
//
//        mc.setQ_text("ข้อใดผิด");
//        mc.setQ_category("multiple");
//        mc.setQ_choice_list("aaa,bbb,ccc,ddd");
//        mc.setQ_answer_list("bbb,ddd");
//        mc.setQ_score(0);
//        ///
//        MultipleChoice mc2 = new MultipleChoice();
//        mc2.setQ_id(6);
//        mc2.setAss_id(2);
//        mc2.setQ_no(4);
//        mc2.setInstruction("Part 1 ข้อสอบ มีทั้งหมด 40 ข้อ ....");
//        mc2.setQ_type("multipleChoice");
//
//        mc2.setQ_text("คนมีแฟนผิดมั้ย");
//        mc2.setQ_category("tf");
//        mc2.setQ_choice_list("true,false");
//        mc2.setQ_answer_list("true");
//        mc2.setQ_score(0);
//        ///
//        MultipleChoice mc3 = new MultipleChoice();
//        mc3.setQ_id(7);
//        mc3.setAss_id(2);
//        mc3.setQ_no(5);
//        mc3.setInstruction("Part 1 ข้อสอบ มีทั้งหมด 40 ข้อ ....");
//        mc3.setQ_type("multipleChoice");
//
//        mc3.setQ_text("ข้อใดต่อไปนี้ถูกต้องที่สุด");
//        mc3.setQ_category("one");
//        mc3.setQ_choice_list("arm,shino,toon");
//        mc3.setQ_answer_list("arm");
//        mc3.setQ_score(0);
//        List<Question> qList = new ArrayList<>();
//        qList.add(mc);
//        qList.add(mc2);
//        qList.add(mc3);
//        Question.addList(qList);
        //
        //get list of question
//        List<Integer> qIdList = new ArrayList<Integer>();
//        qIdList.add(1);
//        List<Question> qList = Question.getListQuestion(qIdList);
//        for (Question question : qList) {
//            System.out.println(question.getQ_id());
//        }
        //
        //delete question
//        Question.delete(5);
//        Question.delete(6);
//        Question.delete(7);
        //
        //get last question ID
//        System.out.println(Question.getLastId());
        //
        //update question
//        FillBlank
//        FillBlank fb = new FillBlank();
//        fb.setQ_id(1);
//        fb.setQ_order(2);
//        fb.delete();
//        
//        MatchWord
//        MatchWord mw = new MatchWord();
//        mw.setQ_id(2);
//        mw.setAss_id(1);
//        mw.setQ_no(1);
//        mw.setInstruction("Part 2 มีทั้งหมด 20 คะแนน แบ่งเป็น ....");
//        mw.setQ_type("matchWord");
//        mw.setQ_title("จงจับคู่คำที่มีความหมายต่างกัน");
//        mw.setQ_text("dark");
//        mw.setQ_answer("light");
//        mw.setQ_score(2);
//        mw.setQ_order(2);
//        Question.update(mw);
//        
        // MultipleChoice
//        MultipleChoice mc = new MultipleChoice();
//        mc.setQ_id(14);
//        mc.setAss_id(2);
//        mc.setQ_no(1);
//        mc.setInstruction("Part 3 ข้อสอบกากบาท มีทั้งหมด 40 ข้อ ....");
//        mc.setQ_type("multipleChoice");
//        mc.setQ_text("ข้อใดต่อไปนี้ถูกต้องที่สุด");
//        mc.setQ_category("one");
//        mc.setQ_choice_list("ans1,ans2,ans3");
//        mc.setQ_answer_list("ans2");
//        mc.setQ_score(0);
//        Question.update(mc);
//        
        //Explain
//        Explain exp = new Explain();
//        exp.setQ_id(4);
//        exp.setAss_id(2);
//        exp.setQ_no(2);
//        exp.setInstruction("Part 1 ข้อสอบ มีทั้งหมด 40 ข้อ ....");
//        exp.setQ_type("explain");
//        exp.setQ_text("จงอธิบายว่าอะไรไม่เกี่ยวกับข้อ ต่อไปนี้");
//        exp.setQ_keyword_check("I dont know what question means?");
//        Question.update(exp);
//            Account ac = Account.login("orarmor@dd", "arm");
//            System.out.println(((AccountCourse)ac.getCourseList().get(1)).getCourse().getName());
//        System.out.println(Announcement.viewAnnByCourse(1));
//        Assignment a = new Assignment();
//        a.setAm_id(2);
//        a.setAss_type("file");
//        a.setDue_date(new Date());
//        System.out.println(Assignment.remainingTimeforSend(a, 2));
        //
        //Test comment object
//        Comment c = new Comment();
//        c.setAcc_id(1);
//        c.setText("หิวข้าวจังเลยยยย");
//        Comment.add(c, 1);
//        c.setAcc_id(2);
//        c.setText("แอบหลงรักเธออยู่แต่เธอคงดูไม่ออก");
//        Comment.add(c, 1);
//         c.setAcc_id(1);
//        c.setText("เก็บความรักไม่กล้าบอก....");
//        Comment.add(c, 1);
        //
//        Comment c = new Comment();
//        c.setAcc_id(1);
//        c.setText("ก็ฉันไม่มีใคร ...");
//        Comment.addToStComment(c, 1, "file");
//        c.setAcc_id(2);
//        c.setText("กลัววันนั้นฉันจะกลายเป็นปัญหา ...");
////        Comment.addToStComment(c, 1, "file");
//        System.out.println(Comment.getCommentByAmID(1));
//        System.out.println(Comment.getCommentByStAmIDFile(1));
        //
//        List<Group_member> l = new ArrayList<>();
//        Group_member g = new Group_member();
//        g.setAcc_id(1);
//        g.setG_no(1);
//        g.setSt_am_id(3);
//        g.setAm_type("file");
//        l.add(g);
//        g.setAcc_id(2);
//        l.add(g);
//        Group_member.addMember(l);
//        Directory directory = null;
//        IndexWriter writer = null;
//        try {
//            directory = FSDirectory.open(new File("web/index/indexdir"));
//            IndexWriterConfig iw = new IndexWriterConfig(Version.LUCENE_47, new ThaiAnalyzer(Version.LUCENE_47));
//            writer = new IndexWriter(directory, iw.setRAMBufferSizeMB(iw.getRAMBufferSizeMB()));
//
//            String st1 = "Be sure to note the document's เป็นการฟาวล์อย่างชัดเจน UUID";
//            Document doc = new Document();
//
//            Field f1 = new Field("name", st1, Store.YES, Index.ANALYZED);
//
//            doc.add(f1);
//            writer.addDocument(doc);
//            String st2 = "เป็นการฟาวล์อย่างชัดเจน UUID";
//            Document doc2 = new Document();
//
//            Field f2 = new Field("name", st1, Store.YES, Index.ANALYZED);
//
//            doc2.add(f2);
//            writer.addDocument(doc2);
//            writer.close();
//
//        } catch (IOException ex) {
//            Logger.getLogger(TestDriver.class
//                    .getName()).log(Level.SEVERE, null, ex);
//        }
//        IndexReader indexReader;
//        try {
//            directory = FSDirectory.open(new File("D:\\Orarmorarm\\The-Assignment\\build\\web\\file\\student_assignment_file\\305\\32"));
//            indexReader = DirectoryReader.open(directory);
//            IndexSearcher searcher = new IndexSearcher(indexReader);
//            QueryParser parser = new QueryParser(Version.LUCENE_47, "student_assignment", new ThaiAnalyzer(Version.LUCENE_47));
//            String keyword = "Layer 2 Data Link";
//            Query query = parser.parse(keyword);
//
//            int hitsPerPage = 10;
//            Sort sort = new Sort(new SortField[]{SortField.FIELD_SCORE, new SortField("student_assignment", SortField.Type.STRING)});
//            TopFieldCollector topField = TopFieldCollector.create(sort, hitsPerPage, true, true, true, false);
//            searcher.search(query, topField);
//            TopDocs docs = topField.topDocs();
//            SimpleHTMLFormatter htmlFormatter = new SimpleHTMLFormatter("<font color=red><b>", "<b></font>");
//            Highlighter highlighter = new Highlighter(htmlFormatter, new QueryScorer(query));
//            for (int i = 0; i < docs.totalHits; i++) {
//                int id = docs.scoreDocs[i].doc;
//                Document doc = searcher.doc(id);
//                String text = doc.get("student_assignment");
//                TokenStream tokenStream = TokenSources.getAnyTokenStream(searcher.getIndexReader(), id, "student_assignment", new ThaiAnalyzer(Version.LUCENE_47));
//
//                String[] hltext = highlighter.getBestFragments(tokenStream, text, hitsPerPage);
//                for (String string : hltext) {
//                    System.out.println(string.toString());
//                }
//                System.out.println("-----------");
////                StringBuilder hltext = new StringBuilder("");
////                TextFragment[] frag = highlighter.getBestTextFragments(tokenStream, text, false, 20);//highlighter.getBestFragments(tokenStream, text, 3, "...");
////                for (int j = 0; j < frag.length; j++) {
////                    if ((frag[j] != null) && (frag[j].getScore() > 0)) {
////                        hltext.append(frag[j].toString());
////                    }
////                }
////                System.out.println(hltext.toString());
////                System.out.println("-------------");
//            }
////            directory = FSDirectory.open(new File("D:\\Orarmorarm\\The-Assignment\\build\\web\\file\\student_assignment_file\\305\\32"));
////            indexReader = DirectoryReader.open(directory);
////            IndexSearcher searcher = new IndexSearcher(indexReader);
////            String keyword = "Layer 2 Data Link";
////
////            QueryParser qp = new QueryParser(Version.LUCENE_47, "student_assignment", new ThaiAnalyzer(Version.LUCENE_47));
////            Query query;
////            query = qp.parse(keyword);
////
////            int hitsPerPage = 10;
////            Sort sort = new Sort(new SortField[]{SortField.FIELD_SCORE, new SortField("student_assignment", SortField.Type.STRING)});
////            TopFieldCollector topField = TopFieldCollector.create(sort, hitsPerPage, true, true, true, false);
////            searcher.search(query, topField);
////            TopDocs docs = topField.topDocs();
////
////            for (ScoreDoc sd : docs.scoreDocs) {
////                Document d = searcher.doc(sd.doc);
////                String student_assignment = d.get("student_assignment");
//////                String hilightText = makeHighligh(student_assignment, keyword, "student_assignment");
////                String st_am_id = d.get("st_am_id");
////                System.out.println(st_am_id + " " + sd.score);
////                System.out.println(hilightText);
////            }
//        } catch (IOException ex) {
//            Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (ParseException ex) {
//            Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (InvalidTokenOffsetsException ex) {
//            Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        System.out.println(StAssignmentFile.getStAmBbyAmIDAndAccId(132, 2, true));
//        System.out.println(StAssignmentOnWeb.getStAmByAmIDAndAccId(127, 2, true));
        String encodedBytes;
        try {
            encodedBytes = Base64.getEncoder().encodeToString("JavaTips.net".getBytes("utf-8"));
            System.out.println("encodedBytes " + encodedBytes);
            byte[] decodedBytes = Base64.getDecoder().decode(encodedBytes);
            System.out.println("decodedBytes " + new String(decodedBytes));
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
