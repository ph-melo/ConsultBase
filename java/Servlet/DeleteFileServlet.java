package Servlet;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteFile")
public class DeleteFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        if (fileName != null && !fileName.isEmpty()) {
            File file = new File("/caminho/pasta/download/" + fileName);
            if (file.exists()) {
                if (file.delete()) {
                    response.sendRedirect("adm_downloads.jsp?message=File deleted successfully");
                } else {
                    response.sendRedirect("adm_downloads.jsp?message=Failed to delete file");
                }
            } else {
                response.sendRedirect("adm_downloads.jsp?message=File not found");
            }
        } else {
            response.sendRedirect("adm_downloads.jsp?message=Invalid file name");
        }
    }
}
