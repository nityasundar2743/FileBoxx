package servlets;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nitya
 */
public class FileManager extends HttpServlet {
    private static final String PARENT_PATH = "C:\\My Codes\\test";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getParameter("path");
        if(path == null || path.isEmpty()){
            path = PARENT_PATH;
        }
        Listfiles(path,req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getParameter("path");
        if(path == null || path.isEmpty()){
            path = PARENT_PATH;
        }
        Listfiles(path,req,resp);
    }
    private void Listfiles(String path, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        File filepath = new File(path);
        File[] filelist = filepath.listFiles();
        
        ArrayList<String> files = new ArrayList<String>();
        ArrayList<String> folders = new ArrayList<String>();
        
        for(File file : filelist){
            if(file.isDirectory())
                folders.add(file.getName());
            else
                files.add(file.getName());
        }
        
        req.setAttribute("path", path);
        req.setAttribute("folders", folders);
        req.setAttribute("files", files);
        try {
        	getServletContext().getRequestDispatcher("/listfiles.jsp").forward(req, resp);
        }catch(ServletException | IOException e) {
        	e.printStackTrace();
        }
    } 
}
