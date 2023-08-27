package servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/UploadManager")
public class UploadManager extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Specify the directory where uploaded files will be saved
        String path = request.getParameter("path");
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        try {
        	List<FileItem> filelist = upload.parseRequest(request);
        	
        	for(FileItem fileitem:filelist) {
        		String filename = fileitem.getName();
        		filename = filename.substring(filename.lastIndexOf("\\")+1);
        		File file = new File(path + File.separator + filename);
        		fileitem.write(file);
        	}
        }catch(Exception e) {
        	System.out.println(e.toString());
        }
        finally {
        	request.setAttribute("path", path);
        	getServletContext().getRequestDispatcher("/FileManager").forward(request, response);
        	
        }
    }
}
