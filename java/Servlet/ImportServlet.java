package Servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "ImportServlet", urlPatterns = {"/ImportServlet"})
public class ImportServlet extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    try {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(4096);
      factory.setDefaultCharset("UTF-8");
      factory.setRepository(new File("/caminho/n/identificado/upload"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setHeaderEncoding("UTF-8");
      
      List<FileItem> items = upload.parseRequest(request);

      if (items.isEmpty()) {
    	  response.getWriter().write("<p style='color: red;'>Nenhum arquivo selecionado.</p>");
          return;
      }
      
	  for (FileItem item : items) {
			if (!item.isFormField() && item.getName().endsWith(".csv")) {
				String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
				String fileName = timeStamp + "_" + item.getName();
				File uploadDir;
				
				if (item.getName().startsWith("fixa")) {
					uploadDir = new File("/caminho/fixa");
				} else if (item.getName().startsWith("movel")) {
					uploadDir = new File("/caminho/movel");
				} else {
					uploadDir = new File("/caminho/upload");
				}
				
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}
				
				item.write(new File(uploadDir, fileName));
			}
	  }

      response.sendRedirect("./uploadArquivo.jsp?envio=OK");
      
      } catch (Exception ex) {
    	  ex.printStackTrace();
      } 
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request, response);
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request, response);
  }
  
}
