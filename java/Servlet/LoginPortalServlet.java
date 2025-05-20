
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import DAO.OracleDAO;
import Model.Usuario;


@WebServlet(name = "LoginPortalServlet", urlPatterns = {"/LoginPortalServlet"})
public class LoginPortalServlet extends HttpServlet {

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
        String user = "", pass = "", action = "", passnew = "", passnew2 = "", senhahex = "";

        OracleDAO dao = new OracleDAO();
        Usuario usuario = new Usuario();
        try {
            user = request.getParameter("user");
            pass = request.getParameter("pass");
            action = request.getParameter("action");
            passnew = request.getParameter("passnew");
            passnew2 = request.getParameter("passnew2");

            MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
            byte messageDigestSenha[] = algorithm.digest(pass.getBytes("UTF-8"));
            StringBuilder hexStringSenha = new StringBuilder();
            for (byte b : messageDigestSenha) {
                hexStringSenha.append(String.format("%02X", 0xFF & b));
            }
            senhahex = hexStringSenha.toString();
           
            //usuario = dao.loginPortal(user, pass);
            usuario = dao.loginPortal(user, senhahex);

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (usuario.getId() > 0) {
            if (action.equals("logar")) {
                 if(senhahex.equals("89240F55DC5FAFE63E1E61B673933BF0C2A2CC3599C5F3")){ //dados ficticios, mas se for igual a uma senha padrao a ferramenta solicita alteração
                    response.setStatus(406);
                }else{
                
                request.getSession().setAttribute("nomeSessao", usuario.getNome());
                request.getSession().setAttribute("loginSessao", usuario.getLogin());
                request.getSession().setMaxInactiveInterval(28800);
                response.getWriter().write("Login com Sucesso!");
                response.setStatus(200);
                 }
            } else if (action.equals("trocarsenha")) {
                
                if (passnew.equals(passnew2)) {
                    try {
                        MessageDigest algorithm2 = MessageDigest.getInstance("SHA-256");
                        byte messageDigestSenha2[] = algorithm2.digest(passnew.getBytes("UTF-8"));
                        StringBuilder hexStringSenha2 = new StringBuilder();
                        for (byte b : messageDigestSenha2) {
                            hexStringSenha2.append(String.format("%02X", 0xFF & b));
                        }
                        String senhahex2 = hexStringSenha2.toString();
                        dao.trocaSenhaUsuario(usuario.getId(), senhahex2);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    response.setStatus(200);
                } else {
                    response.setStatus(401);
                }
            }

        } else {
            response.setStatus(401);
        }

    }

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
