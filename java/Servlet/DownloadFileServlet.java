package Servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/DownloadFile")

public class DownloadFileServlet extends HttpServlet {

    private static final String DIRECTORY_PATH = "/caminho/pasta/download";
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fileName = request.getParameter("fileName");

        if (fileName == null || fileName.isEmpty()) {

            response.getWriter().write("Nome do arquivo inv�lido");

            return;

        }

        File file = new File(DIRECTORY_PATH, fileName);

        if (!file.exists() || !file.isFile()) {

            response.getWriter().write("Arquivo n�o encontrado");

            return;

        }
 
        response.setContentType("text/csv");

        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

        try (FileInputStream fileInputStream = new FileInputStream(file);

             OutputStream outputStream = response.getOutputStream()) {

            byte[] buffer = new byte[1024];

            int bytesRead;

            while ((bytesRead = fileInputStream.read(buffer)) != -1) {

                outputStream.write(buffer, 0, bytesRead);

            }

        }

    }

}
