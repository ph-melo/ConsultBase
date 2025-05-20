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

  <title>Editando Acessos</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

<script>
	function editar() {
	         window.location = './adm_acessos.jsp';
	            }
</script>

  <%
      OracleDAO dao = new OracleDAO();
  %>
</head>

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
        <h1>Usuários editando...
        <button onclick="editar()" class="btn"><i class="fas fa-sign-out-alt" aria-hidden="true"></i></button> </h1>

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
                    <th>SALVAR</th>
                  </tr>
                </thead>
                <tbody>
                  <%
                      List<Login> listLogin = dao.retornaLogin();
                      for (Login lg : listLogin) {
                    	  String status = "";
                    	  if(lg.getStatus() == 1){
                    		  status = "Ativo";
                    	  }else if(lg.getStatus() == 0){
                    		  status = "Inativo";
                    	  }
                    %>
                          <form action="SistemasServlet" method="POST">
                            <input type="hidden" id="action" name="action" value="alteraServidor">
                      
                            <tr>
                            <td><input class="form-control" id="logid" name="logid" value="<%=lg.getId()%>"></td>
                            <td><input class="form-control"  id="loglogin" name="loglogin" value="<%=lg.getLogin()%>"></td>
                            <td><input class="form-control"  id="logsenha" name="logsenha" value="<%=lg.getSenha()%>"></td>
                            <td><input class="form-control"  id="logdescricao" name="logdescricao" value="<%=lg.getDescricao()%>"></td>
                            <td><input class="form-control"  id="logstatus" name="logstatus" value="<%=lg.getStatus()%>"></td>
                            <td><input class="form-control"  id="logtelefone" name="logtelefone" value="<%=lg.getTelefone()%>"></td>
                            <td><input class="form-control"  id="logperfil" name="logperfil" value="<%=lg.getPerfil()%>"></td>
                            <td><button class="btn btn-success">Salvar</button></td>
                            </tr>
                            </form>
                          
                         <% 
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
