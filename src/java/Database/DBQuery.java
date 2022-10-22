/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author moham
 */
public class DBQuery {
    Connection con;
    Statement st;
    ResultSet rs;
    
    public int user_signup(String username,String first_name,String last_name,String phone,String email,String password){
        int i=0;
        try{
            con = DBConnection.getConnection();
            st =con.createStatement();
            String q = "insert into USER values('"+username+"','"+first_name+"','"+last_name+"','"+phone+"','"+email+"','"+password+"')";
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public int user_login(String username,String password){
        int i=0;
        
        try{
            con = DBConnection.getConnection();
            st = con.createStatement();
            String q = "select * from USER where username = '"+username+"' and password='"+password+"'";
            rs = st.executeQuery(q);
            if(rs.next())
                i =1;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return i;
    }
    
    public int add_venue(String name,String location,String category,String capacity,String price){
        int i=0;
        try{
            int cap = Integer.parseInt(capacity);
            int pri = Integer.parseInt(price);
            String q = "insert into venue (venue_name,location,catogery,capacity,price) values('"+name+"','"+location+"','"+category+"',"+cap+","+pri+")";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    public ArrayList get_venues(){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from venue";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs  = st.executeQuery(q);
            while(rs.next()){
                String id = rs.getString("venue_id");
                String name = rs.getString("venue_name");
                String location = rs.getString("location");
                String catogery = rs.getString("catogery");
                String capacity = rs.getString("capacity");
                String price = rs.getString("price");
                String data = id+"#"+name+"#"+location+"#"+catogery+"#"+capacity+"#"+price;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    
    public int delete_venue(String id){
        int i=0;
        try{
            String q = "delete from venue where venue_id = '"+id+"'";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }
    
    public int add_booking_queue(String username,int venue_id){
        int i =0;
        try{
            String q = "insert into venue_booking_queue (user_name,venue_id) values('"+username+"',"+venue_id+")";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public ArrayList get_orders(String username){
        ArrayList al = new ArrayList();
        try{
            System.out.println(username);
            String q="select * from venue where venue_id IN(select venue_id from venue_booking_queue where user_name = '"+username+"')";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            System.out.println("here");
            while(rs.next()){
                String id = rs.getString("venue_id");
                String name = rs.getString("venue_name");
                String location = rs.getString("location");
                String catogery = rs.getString("catogery");
                String capacity = rs.getString("capacity");
                String price = rs.getString("price");
                String res = id+"#"+name+"#"+location+"#"+catogery+"#"+capacity+"#"+price;
                al.add(res);
            }
//                SELECT user.first_name
//FROM user
//INNER JOIN venue_booking_queue ON user.username=venue_booking_queue.user_name
        }
        catch(Exception e){
            e.printStackTrace();
            
        }
        return al;
    }
    
    public int remove_venue_order(int id,String username){
        int i =0;
        
        try{
          String q = "Delete from venue_booking_queue where venue_id="+id+" and user_name='"+username+"'";  
          con = DBConnection.getConnection();
          st = con.createStatement();
          i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return i;
    }
    
    public int add_services(String username,String service,String category,String sub,String price){
        int i=0;
        try{
            String q = "insert into services (user_name,service,category,`sub-category`,price) values('"+username+"','"+service+"','"+category+"','"+sub+"','"+price+"')";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public ArrayList get_added_services(String username){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from services where user_name='"+username+"'";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String service = rs.getString("service");
                String cat = rs.getString("category");
                String sub = rs.getString("sub-category");
                String price = rs.getString("price");
                String data = service+"#"+cat+"#"+sub+"#"+price;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    
    public int remove_added_service(String username,String service,String category){
        int i=0;
        try{
            String q = "delete from services where user_name='"+username+"' and (service='"+service+"' and category='"+category+"')";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public int book_venue(String username){
        int i=0;
        try{
            String q = "insert into booked_venue(user_name,venue_id) select * from venue_booking_queue where user_name ='"+username+"'";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public int book_service(String username){
        int i=0;
        try{
            String q = "insert into booked_services(user_name,service,category,`sub-category`,price) select * from services where user_name='"+username+"'";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
     public ArrayList get_booked_services(String username){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from booked_services where user_name = '"+username+"' and is_approved=0";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                 String service = rs.getString("service");
                String cat = rs.getString("category");
                String sub = rs.getString("sub-category");
                String data = service+"#"+cat+"#"+sub;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }   
    
    public ArrayList get_booked_venues(String username){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from venue where venue_id IN (select venue_id from booked_venue where user_name='"+username+"' and is_approved = 0)";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String name = rs.getString("venue_name");
                String location = rs.getString("location");
                String catogery = rs.getString("catogery");
                String capacity = rs.getString("capacity");
                String price = rs.getString("price");
                
                String data = name+"#"+location+"#"+catogery+"#"+capacity+"#"+price;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    
     public ArrayList get_paid_venues(int id){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from venue where venue_id IN (select venue_id from paid_venue where transaction_id in (select transaction_id from payment where transaction_id="+id+"))";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String name = rs.getString("venue_name");
                String location = rs.getString("location");
                String catogery = rs.getString("catogery");
                String capacity = rs.getString("capacity");
                String price = rs.getString("price");
                
                String data = name+"#"+location+"#"+catogery+"#"+capacity+"#"+price;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
     

    
     public ArrayList get_all_paid_services(int id){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from paid_services where tranaction_id in (select transaction_id from payment where transaction_id = "+id+")";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                 String service = rs.getString("service");
                String cat = rs.getString("category");
                String sub = rs.getString("sub-category");
                String data = service+"#"+cat+"#"+sub;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }   
         public ArrayList get_approved_services(String username){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from booked_services where user_name='"+username+"' and is_approved=1";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                 String service = rs.getString("service");
                String cat = rs.getString("category");
                String sub = rs.getString("sub-category");
                String price = rs.getString("price");
                String data = service+"#"+cat+"#"+sub+"#"+price;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }   
     
     
    public ArrayList get_all_booked_services(int num){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from booked_services where  is_approved="+num+"";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String username = rs.getString("user_name");
                 String service = rs.getString("service");
                String cat = rs.getString("category");
                String sub = rs.getString("sub-category");
                String price = rs.getString("price");
                String data = service+"#"+cat+"#"+sub+"#"+price+"#"+username;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }   
     
    public ArrayList view_all_user_bookings(){
        ArrayList al = new ArrayList();
        
        try{
            String q = "select b.user_name, v.venue_id,v.venue_name,v.location,v.catogery,v.capacity,v.price from venue v natural join booked_venue b where is_approved=0";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String username = rs.getString("user_name");
                System.out.println(username);
                String id = rs.getString("venue_id");
                String name = rs.getString("venue_name");
                String location = rs.getString("location");
                String catogery = rs.getString("catogery");
                String capacity = rs.getString("capacity");
                String price = rs.getString("price");
                
                String data = id+"#"+name+"#"+location+"#"+catogery+"#"+capacity+"#"+price+"#"+username;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    
     public int completed_service(String username,String service,String category){
        int i=0;
        try{
            String q = "update booked_services set is_approved=1 where user_name='"+username+"' and service='"+service+"' and category='"+category+"'";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return i;
    }
    
    
    public int completed(String username,String venue_id){
        int i=0;
        int id = Integer.parseInt(venue_id);
        try{
            String q = "update booked_venue set is_approved=1 where user_name='"+username+"' and venue_id='"+id+"'";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return i;
    }
    
    public ArrayList get_all_completed(){
        ArrayList al = new ArrayList();
        try{
            String q =  "select b.user_name, v.venue_id,v.venue_name,v.location,v.catogery,v.capacity,v.price from venue v natural join booked_venue b where is_approved=1";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String username = rs.getString("user_name");
                System.out.println(username);
                String id = rs.getString("venue_id");
                String name = rs.getString("venue_name");
                String location = rs.getString("location");
                String catogery = rs.getString("catogery");
                String capacity = rs.getString("capacity");
                String price = rs.getString("price");
                
                String data = id+"#"+name+"#"+location+"#"+catogery+"#"+capacity+"#"+price+"#"+username;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    
    public ArrayList get_completed_booked_venue(String username){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from venue where venue_id IN (select venue_id from booked_venue where user_name='"+username+"' and is_approved=1)";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String name = rs.getString("venue_name");
                String location = rs.getString("location");
                String catogery = rs.getString("catogery");
                String capacity = rs.getString("capacity");
                String price = rs.getString("price");
                
                String data = name+"#"+location+"#"+catogery+"#"+capacity+"#"+price;
                al.add(data);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    public void delete_service_added(String username){
        
        try{
            String q1 ="delete from services where user_name='"+username+"'";
           
          con = DBConnection.getConnection();
            st = con.createStatement();
            st.executeUpdate(q1);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }
    public void delete_venues_added(String username){
        try{
             String q2 = "delete from venue_booking_queue where user_name='"+username+"'";
               con = DBConnection.getConnection();
            st = con.createStatement();
            st.execute(q2);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public int check_transaction(int num){
        int i=0;
        try{
            String q = "select * from payment where transaction_id="+num+"";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            if(rs.next())
                i=1;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public int insert_into_payment(int transaction,String username,String amount,String date){
        int i=0;
        try{
            String q ="insert into payment values("+transaction+",'"+username+"','"+amount+"','"+date+"')";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }   
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    public int insert_into_paid_service(String username,int transaction_id){
        int i=0;
        try{
            String q = "insert into paid_services (select p.transaction_id,b.service,b.category,b.`sub-category` from payment p ,booked_services b where p.transaction_id = "+transaction_id+" and b.user_name='"+username+"' and b.is_approved=1)";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }
    
    public int delete_booked_services(String username,int num){
        int i=0;
        try{
            String q = "delete from booked_services where user_name='"+username+"' and is_approved="+num+"";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return i;
    }
    
    public int insert_into_paid_venue(String username,int transaction_id){
        int i=0;
        try{
            String q = "insert into paid_venue (select p.transaction_id,b.venue_id from payment p ,booked_venue b where p.transaction_id = "+transaction_id+" and b.user_name='"+username+"' and b.is_approved=1)";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    public int delete_from_booked_venue(String username,int num){
        int i=0;
        try{
            String q = "delete from booked_venue where user_name='"+username+"' and is_approved="+num+"";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public ArrayList get_all_transactions(){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from payment";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String transaction_id = rs.getString("transaction_id");
                String username = rs.getString("user_name");
                String amount = rs.getString("amount");
                String date = rs.getString("date");
                String data = transaction_id+"#"+username+"#"+amount+"#"+date;
                al.add(data);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return al;
    }
    
//    public ArrayList get_paid_venues(int id){
//        ArrayList al = new ArrayList();
//        try{
//            String q = "select * from venue where venue_id in (select venue_id from paid_venue where transaction_id="+id+")";
//            con = DBConnection.getConnection();
//            st = con.createStatement();
//            rs = st.executeQuery(q);
//            while(rs.next()){
//                String venue_name = rs.getString("venue_name");
//                String location = rs.getString("location");
//                String data = venue_name+"#"+location;
//                al.add(data);
//            }
//        }
//        catch(Exception e)
//        {
//            e.printStackTrace();
//        }
//        return al;
//    }
    
    public ArrayList get_paid_services(int id){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from paid_services where tranaction_id="+id+"";
            con = DBConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(q);
            while(rs.next()){
                String venue_name = rs.getString("service");
                String location = rs.getString("category");
                String data = venue_name+"#"+location;
                al.add(data);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return al;
    }
    
    public ArrayList get_all_transactions_of_a_user(String username){
        ArrayList al = new ArrayList();
        
        try{
           String q = "select * from payment where user_name='"+username+"'" ;
           con = DBConnection.getConnection();
           st = con.createStatement();
           rs= st.executeQuery(q);
           while(rs.next()){
               String id = rs.getString("transaction_id");
               String amount = rs.getString("amount");
               String date = rs.getString("date");
               String data = id+"#"+amount+"#"+date;
               al.add(data);
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return al;
    }
}
