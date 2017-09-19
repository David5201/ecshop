package com.lbcto.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderCodeNo{
         
     public static void main(String[] args) throws InterruptedException {    
         for (int i = 0; i < 10000; i++) {    
             System.out.println(OrderCodeNo.getOrderNo());    
             Thread.sleep(1000);    
         }    
     }    
     
     /**  
      * 生成订单编号  
      * @return  
      */    
     public static synchronized long getOrderNo() {    
         String str = new SimpleDateFormat("yyMMddHHmmss").format(new Date());    
         return Long.parseLong(str);    
     }    

}
