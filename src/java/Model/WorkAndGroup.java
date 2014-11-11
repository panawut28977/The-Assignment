/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Orarmor
 */
public class WorkAndGroup {

    private double am_score;
    private Timestamp checked_date;
    private Group_member detail;
    private List<Account> group;

    public double getAm_score() {
        return am_score;
    }

    public void setAm_score(double am_score) {
        this.am_score = am_score;
    }

    public Timestamp getChecked_date() {
        return checked_date;
    }

    public void setChecked_date(Timestamp checked_date) {
        this.checked_date = checked_date;
    }
    
    public Group_member getDetail() {
        return detail;
    }

    public void setDetail(Group_member detail) {
        this.detail = detail;
    }

    public List<Account> getGroup() {
        return group;
    }

    public void setGroup(List<Account> group) {
        this.group = group;
    }

    public static List<WorkAndGroup> memberToWorkGroup(List<Group_member> mlist, Assignment am) {
        List<WorkAndGroup> wag = new ArrayList<>();
        WorkAndGroup w = null;
        for (Group_member group_member : mlist) {
            w = new WorkAndGroup();
            
            w.setDetail(group_member);
            
            //set group account
            List<Account> la = new ArrayList<>();
            String accList[] = group_member.getAcc_id().split(",");
            for (String acc : accList) {
                la.add(Account.getNameByID(Integer.parseInt(acc)));
            }
            w.setGroup(la);

            //check am score
            if (am.getAss_type().equalsIgnoreCase("file")) {
                if (am.getTotal_member() > 1) {
                    StAssignmentFile stf = StAssignmentFile.getStAmBbyAmIDAndGID(am.getAm_id(), group_member.getG_id());
                    w.setAm_score(stf.getScore());
                    w.setChecked_date(stf.getChecked_time());
                } else {
                    StAssignmentFile stf = StAssignmentFile.getStAmBbyAmIDAndAccId(am.getAm_id(), la.get(0).getAcc_id());
                    w.setAm_score(stf.getScore());
                    w.setChecked_date(stf.getChecked_time());
                }
            } else if (am.getAss_type().equalsIgnoreCase("web")) {
                if (am.getTotal_member() > 1) {
                    System.out.println(am.getAm_id());
                    System.out.println(group_member.getG_id());
                    StAssignmentOnWeb stow = StAssignmentOnWeb.getStAmbyAmIDAndGID(am.getAm_id(), group_member.getG_id());
                    w.setAm_score(stow.getScore());
                    w.setChecked_date(stow.getChecked_time());
                } else {
                    StAssignmentOnWeb stow = StAssignmentOnWeb.getStAmByAmIDAndAccId(am.getAm_id(), la.get(0).getAcc_id());
                    w.setAm_score(stow.getScore());
                    w.setChecked_date(stow.getChecked_time());
                }
            }

            wag.add(w);

        }
        return wag;
    }

    @Override
    public String toString() {
        return "WorkAndGroup{" + "am_score=" + am_score + ", checked_date=" + checked_date + ", detail=" + detail + ", group=" + group + '}';
    }

}
