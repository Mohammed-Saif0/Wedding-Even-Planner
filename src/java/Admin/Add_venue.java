package Admin;

import Database.DBQuery;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 91988
 */
public class Add_venue extends HttpServlet {
   
String path="C:/Users/moham/OneDrive/Documents/NetBeansProjects/Wedding_planner/web/img/";
String paramname="",name="",location="",capacity="",category="",price="";
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           try{

           
           MultipartRequest multi = new MultipartRequest(request, path,	10 * 1024 * 1024);
           // to get all the parameters 
           Enumeration params = multi.getParameterNames();
           while (params.hasMoreElements()) 
            {
                paramname = (String) params.nextElement();
                if(paramname.equalsIgnoreCase("name"))
                {
                        name=multi.getParameter(paramname);
                }
                
                if(paramname.equalsIgnoreCase("location"))
                {
                        location=multi.getParameter(paramname);
                }
                if(paramname.equalsIgnoreCase("category"))
                {
                        category=multi.getParameter(paramname);
                }
                if(paramname.equalsIgnoreCase("capacity"))
                {
                        capacity=multi.getParameter(paramname);
                }
                if(paramname.equalsIgnoreCase("price"))
                {
                        price=multi.getParameter(paramname);
                }
            }
           
           
           
           Enumeration files = multi.getFileNames();	
            while (files.hasMoreElements()) 
            {
                paramname = (String) files.nextElement();
                if(paramname != null && paramname.equals("file_name"))
                {
                               
                    String filename = multi.getFilesystemName(paramname);
                    String fPath = path+filename;
                    System.out.println("report>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+fPath);
                    if(!fPath.contains("null"))  
                    {
                       File file = new File(fPath);
                       FileInputStream fsR = new FileInputStream(file);
                       
                       

                       String newPath=path+name+".png";
                       System.out.println("png path "+newPath);
                       FileOutputStream foutReport=new FileOutputStream(newPath);
                       int j=0;
                          while((j=fsR.read())!=-1)
                          {

                          foutReport.write((byte)j);

                          }
                          fsR.close();
                          foutReport.close();
                          file.delete();
                    }
                }  
            }
                        
          
           
           System.out.println(capacity);
           System.out.println(price);
           DBQuery db = new DBQuery();
           db.add_venue(name, location, category, capacity, price);
           RequestDispatcher rd = null;
                rd = request.getRequestDispatcher("./admin/admin_home.jsp");
                rd.forward(request, response);
           
           }catch(Exception e)
           {
           e.printStackTrace();
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


