<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.OracleDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="Model.*" %>

<%
    String nomeSessao = (String) session.getAttribute("nomeSessao");
    if (nomeSessao == null || nomeSessao.trim().isEmpty()) {
        response.sendRedirect("adm_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Adm - Acessos</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <%
      OracleDAO dao = new OracleDAO();
  %>
</head>

<script>
	function editar() {
	         window.location = './adm_acessos_edit.jsp';
	            }
</script>

<body id="page-top">

  <nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
      <i class="fas fa-user"></i>&nbsp;&nbsp;&nbsp; Área Administrativa - Lista de usuários
    </a>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./adm_upload.jsp">
          <i class="fas fa-fw fa-upload"></i> Lista de Upload</a>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./adm_downloads.jsp">
          <i class="fas fa-fw fa-download"></i> Lista de Download</a>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-users"></i> Lista de Acessos
        </a>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="adm_logs.jsp">
          <i class="fas fa-fw fa-search"></i> Verificar Logs
        </a>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./index.jsp">
          <i class="fas fa-sign-out-alt"></i> Sair
        </a>
      </li>
    </ul>
  </nav>

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Begin Page Content -->
      <div class="container-fluid">
        <br/>
        <br/>
        <h1>Usuários
        <button onclick="editar()" class="btn"><i class="fa fa-cogs" aria-hidden="true"></i></button>
        </h1>

        <!-- Content Row -->
        <a style="color:black" data-toggle="collapse" href="#collapseAcessos" aria-expanded="false" aria-controls="collapseAcessos">
          Lista de Acessos ->
        </a>
        <hr>

        <div class="collapse" id="collapseAcessos">
          <div class="row">
            <div class="table-responsive">
              <table class="table table-bordered table-striped" id="dataTableAcessos" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>LOGIN</th>
                    <th>SENHA</th>
                    <th>DESCRIÇÃO</th>
                    <th>STATUS</th>
                    <th>TELEFONE</th>
                    <th>PERFIL</th>
                  </tr>
                </thead>
                <tbody>
                  <%
   
                      List<Login> listLogin = dao.retornaLogin();
                      for (Login lg : listLogin) {
                    	  String status = "";
                    	  if (lg.getStatus() == 1){
                    		  status = "Ativo";
                    	  } else if (lg.getStatus() == 0){
                    		  status = "Inativo";
                    	  }
                    	  
                          out.println("<tr>");
                          out.println("<td><button class='btn btn-light' onclick='selectElementContents(this)' value='" + lg.getId() + "'>" + lg.getId() + "</button></td>");
                          out.println("<td><button class='btn btn-light' onclick='selectElementContents(this)' value='" + lg.getLogin() + "'>" + lg.getLogin() + "</button></td>");
                          out.println("<td><button class='btn btn-light' onclick='selectElementContents(this)' value='" + lg.getSenha() + "'>SENHA</button></td>");
                          out.println("<td><button class='btn btn-light' onclick='selectElementContents(this)' value='" + lg.getDescricao() + "'>" + lg.getDescricao() + "</button></td>");
                          out.println("<td>" + status + "</td>");
                          out.println("<td><button class='btn btn-light' onclick='selectElementContents(this)' value='" + lg.getTelefone() + "'>" + lg.getTelefone() + "</button></td>");
                          out.println("<td><button class='btn btn-light' onclick='selectElementContents(this)' value='" + lg.getPerfil() + "'>" + lg.getPerfil() + "</button></td>");
                          out.println("</tr>");
                      }
                  %>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/sb-admin-2.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script src="vendor/chart.js/Chart.min.js"></script>

</body>
</html>
