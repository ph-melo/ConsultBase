
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.OracleDAO;
import Model.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "SistemasServlet", urlPatterns = {"/SistemasServlet"})
public class SistemasServlet extends HttpServlet {

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
            String action = request.getParameter("action");
            String sistemaid = request.getParameter("sistemaid");
            String collapse = "#collapse";
            OracleDAO dao = new OracleDAO();
            if(action.equals("identificar")){
                String listaServidores = request.getParameter("listaservidores");
                List listaCorp = new ArrayList();

                
                String[] listServers = listaServidores.split("\n");
                 List listaNotCorp = new ArrayList();
                String servidores = ""; 
                 
                for (String server : listServers){  
                    servidores += "upper('" + server + "'),";
                   listaNotCorp.add(server.toUpperCase().trim().replace("\r",""));
                }  
                if(listServers.length > 0){
                    servidores = servidores.substring(0, servidores.length() - 1);
                }
                
                try {
                    listaCorp = dao.retornaServidorIdentifica(servidores);
                } catch (SQLException ex) {
                    Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
                List<Servidor> listaServidoresAux = listaCorp;
                
                    for(Servidor sv : listaServidoresAux){
                        
                        if(!listaNotCorp.isEmpty()){
                            listaNotCorp.remove(sv.getHostname().toUpperCase().trim().replace("\r",""));
                        }
                        if(!listaNotCorp.isEmpty() && sv.getIp() != null && !sv.getIp().equals("null")){
                            listaNotCorp.remove(sv.getIp().toUpperCase().trim().replace("\r",""));
                        }
                        
                    }
                
                    
                
                
                
                request.getSession().setAttribute("listaNotCorp", listaNotCorp);           
                request.getSession().setAttribute("listaCorp", listaCorp);
                response.sendRedirect("./identifica_servidor.jsp");
                
            }else{
                if(action.equals("alteraDesc")){
                	Sistema sisdesc = new Sistema();
                	sisdesc.setDescricao(request.getParameter("desc"));
                	sisdesc.setIc(request.getParameter("ic")); 
                	sisdesc.setId(Integer.parseInt(sistemaid));
                    collapse += "Desc";
                    try {
                        dao.alteraDescSistema(sisdesc);
                    } catch (SQLException ex) {
                        Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                	
                }else if(action.equals("alteraLink") || action.equals("insereLink") ){
                     collapse += "Links";
                     Link link = new Link();
                     link.setUrl(request.getParameter("linkurl"));
                     link.setUsuario(request.getParameter("linkusuario"));
                     link.setSenha(request.getParameter("linksenha"));
                     link.setInfo(request.getParameter("linkinfo"));
                     link.setSms(Integer.parseInt(request.getParameter("linksms")));
                    if(action.equals("alteraLink")){
                        link.setId(Integer.parseInt(request.getParameter("linkid")));
                         try {
                             dao.alteraLinkSistema(link);
                         } catch (SQLException ex) {
                             Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                         }
                    }else if(action.equals("insereLink")){
                         try {
                             dao.insereLinkSistema(link, sistemaid);
                         } catch (SQLException ex) {
                             Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                         }
                    }
                    
                }else if(action.equals("alteraBanco") || action.equals("insereBanco") ){
                     collapse += "Banco";
                     Banco bc = new Banco();
                     bc.setHostname(request.getParameter("bancohostname"));
                     bc.setPorta(Integer.parseInt(request.getParameter("bancoporta")));
                     bc.setServico(request.getParameter("bancoservico"));
                     bc.setUsuario(request.getParameter("bancousuario")); 
                     bc.setSenha(request.getParameter("bancosenha"));
                     bc.setEnviasms(Integer.parseInt(request.getParameter("bancosms")));
                    if(action.equals("alteraBanco")){
                        bc.setId(Integer.parseInt(request.getParameter("bancoid")));
                         try {
                             dao.alteraBancoSistema(bc);
                         } catch (SQLException ex) {
                             Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                         }
                    }else if(action.equals("insereBanco")){
                         try {
                             dao.insereBancoSistema(bc, sistemaid);
                         } catch (SQLException ex) {
                             Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                         }
                    }
                    
                }else if(action.equals("alteraServidor")|| action.equals("insereServidor")){
                    collapse += "Servidores";
                    Login log = new Login(); 
                    log.setLogin(request.getParameter("loglogin"));
                     log.setSenha(request.getParameter("logsenha"));
                     log.setDescricao(request.getParameter("logdescricao"));
                     log.setTelefone(request.getParameter("logtelefone"));
                     log.setPerfil(request.getParameter("logperfil"));
                     log.setStatus(Integer.parseInt(request.getParameter("logstatus")));
                    if(action.equals("alteraServidor")){
                        log.setId(Integer.parseInt(request.getParameter("logid")));
                        try {
                            dao.alteraAcessoAdm( log);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }else if(action.equals("insereServidor")){
                        try {
                            dao.insereAcessoAdm(log, sistemaid);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                    
                }else if(action.equals("alteraLog")|| action.equals("insereLog")){
                    collapse += "Logs";
                    Log lg = new Log();
                     lg.setCaminho(request.getParameter("logcaminho"));
                     lg.setDescricao(request.getParameter("logdescricao"));
            
                    if(action.equals("alteraLog")){
                        lg.setId(Integer.parseInt(request.getParameter("logid")));
                        try {
                            dao.alteraLogSistema(lg);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }else if(action.equals("insereLog")){
                        try {
                            dao.insereLogSistema(lg, sistemaid);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                    
                }else if(action.equals("alteraContato")|| action.equals("insereContato")){
                    collapse += "Contatos";
                    Contato con = new Contato();
                     con.setNome(request.getParameter("ctnome"));
                     con.setEmail(request.getParameter("ctemail"));
                     con.setArea(request.getParameter("ctarea"));
                     con.setTelefone(request.getParameter("cttelefone"));
                    if(action.equals("alteraContato")){
                        con.setId(Integer.parseInt(request.getParameter("contatoid")));
                        try {
                            dao.alteraContatoSistema(con);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }else if(action.equals("insereContato")){
                        try {
                            dao.insereContatoSistema(con, sistemaid);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                    
                }else if(action.equals("alteraContatoDep")|| action.equals("insereContatoDep")){
                    Contato con = new Contato();
                     con.setNome(request.getParameter("ctnome"));
                     con.setEmail(request.getParameter("ctemail"));
                     con.setTelefone(request.getParameter("cttelefone"));
                     con.setServidor(request.getParameter("ctservidor"));
                     con.setSistema(request.getParameter("ctsistema"));
                    if(action.equals("alteraContatoDep")){
                        con.setId(Integer.parseInt(request.getParameter("contatoid")));
                        try {
                            dao.alteraContatoDepartamental(con);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }else if(action.equals("insereContatoDep")){
                        try {
                            dao.insereContatoDepartamental(con);
                        } catch (SQLException ex) {
                            Logger.getLogger(SistemasServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                  
                  
                }
                
                if(action.equals("alteraContatoDep")|| action.equals("insereContatoDep")){
                    response.sendRedirect("./sistemas_departamentais_edit.jsp" );
                }else{
                response.sendRedirect("./sistemas_edit.jsp?s=" + sistemaid + collapse );
                }
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
