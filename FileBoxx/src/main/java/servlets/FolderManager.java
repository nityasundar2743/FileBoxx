package servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FolderManager
 */
@WebServlet("/FolderManager")
public class FolderManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FolderManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getParameter("path");
		String folder = request.getParameter("folder");
		try {
			if(request.getParameter("action").equalsIgnoreCase("create")) {
				File newfolder = new File(path+File.separator+folder);
				if(!newfolder.exists()) {
					newfolder.mkdir();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			request.setAttribute("path", path);
			getServletContext().getRequestDispatcher("/FileManager").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
