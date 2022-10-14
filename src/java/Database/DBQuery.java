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
            String q="select * from venue where venue_id IN(select venue_id from venue_booking_queue where user_name = '"+username+"' and is_booked=0)";
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
            String q = "select * from services where user_name='"+username+"' and is_booked=0";
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
            String q = "update venue_booking_queue set is_booked=1 where user_name='"+username+"'";
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
            String q = "update services set is_booked=1 where user_name='"+username+"'";
            con = DBConnection.getConnection();
            st = con.createStatement();
            i = st.executeUpdate(q);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return i;
    }
    
    public ArrayList get_booked_venues(String username){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from venue where venue_id IN (select venue_id from venue_booking_queue where user_name='"+username+"' and is_booked=1)";
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
    
     public ArrayList get_boooked_services(String username){
        ArrayList al = new ArrayList();
        try{
            String q = "select * from services where user_name = '"+username+"' and is_booked=1";
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
    
}
