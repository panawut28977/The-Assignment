/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

/**
 *
 * @author longd29
 */
public class Parse {
    public static Long stringToLong(String no){
        return Long.parseLong(no);
    }
    
    public static void main(String[] args) {
        Long d = stringToLong("2");
        System.out.println(d);
    }
}
