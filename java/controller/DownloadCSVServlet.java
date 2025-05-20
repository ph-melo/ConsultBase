package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadCSVServlet")
public class DownloadCSVServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");

        if (fileName == null || fileName.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Nome do arquivo inv�lido!");
            return;
        }

        fileName = URLDecoder.decode(fileName, "UTF-8");

        // Certifique-se de que o caminho do diret�rio est� correto
        String diretorio = "C:\\Temp";  // Ajuste este caminho conforme necess�rio
        File file = new File(diretorio, fileName);

        // Adicione logs para depura��o
        System.out.println("Tentando baixar o arquivo: " + file.getAbsolutePath());

        if (!file.exists()) {
            System.out.println("Arquivo n�o encontrado: " + file.getAbsolutePath());
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Arquivo n�o encontrado!");
            return;
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        response.setContentLength((int) file.length());

        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace(); 
        }
    }
}

