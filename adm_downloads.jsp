<%@page import="java.util.*"%>
<%@page import="java.io.File"%>

<%
    if (request.getSession().getAttribute("nomeSessao") == null || request.getSession().getAttribute("nomeSessao").equals("")) {
             response.sendRedirect("./adm_login.jsp");
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
  <title>Adm - Downloads</title>
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <script>
    function filtrarArquivos() {
      var input = document.getElementById("filtro");
      var filter = input.value.toUpperCase();
      var lista = document.getElementsByTagName("li");
      for (var i = 0; i < lista.length; i++) {
        var item = lista[i];
        if (item.classList.contains("filtro-exclusivo")) {
          continue;
        }
        var arquivo = item.textContent || item.innerText;
        if (arquivo.toUpperCase().indexOf(filter) > -1) {
          item.style.display = "";
        } else {
          item.style.display = "none";
        }
      }
    }
    
    document.addEventListener("DOMContentLoaded", function() {
      var inputArquivo = document.getElementById("arquivo");
      var btnConfirmarEnvio = document.querySelector("button[type='submit']");
      
      inputArquivo.onchange = function() {
        if (inputArquivo.value) {
          btnConfirmarEnvio.disabled = false;
        } else {
          btnConfirmarEnvio.disabled = true;
        }
      }
    });
  </script>
</head>
<body id="page-top">
  <nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
      <i class="fas fa-user"></i>&nbsp;&nbsp;&nbsp; Área Administrativa - Lista de Downloads
    </a>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./adm_upload.jsp">
          <i class="fas fa-fw fa-upload"></i> Lista de Upload
        </a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./adm_downloads.jsp">
          <i class="fas fa-fw fa-download"></i> Lista de Download
        </a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./adm_acessos.jsp">
          <i class="fas fa-fw fa-users"></i> Lista de Acessos 
        </a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./adm_logs.jsp">
          <i class="fas fa-fw fa-search"></i> Verificar Logs
        </a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item filtro-exclusivo">
        <a class="nav-link" href="./adm_login.jsp?exit=1">
          <i class="fas fa-sign-out-alt"></i> Sair
        </a>
      </li>
    </ul>
  </nav>
  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <div class="container-fluid">
        <br/>
        <br/>
        <h2>Lista de arquivos para Download</h2>
        <div class="input-group col-md-6 mb-3">
          <input type="search" class="form-control rounded" placeholder="Consultar" id="filtro" onkeyup="filtrarArquivos()">
          <span class="input-group-text border-0">
            <i class="fas fa-search"></i>
          </span>
        </div>
        <ul class="list-group">
          <% 
            File folder = new File("/home/pcpcorp/portal_juridico/download/"); ///home/pcpcorp/portal_juridico/download/
            File[] files = folder.listFiles((dir, name) -> name.toLowerCase().endsWith(".csv"));
            if (files != null) {
              Arrays.sort(files);
              for (File file : files) {
          %>
            <li class="list-group-item d-flex justify-content-between align-items-center arquivo-item">
              <%= file.getName() %>
              <div>
                <a href="${pageContext.request.contextPath}/DownloadFile?fileName=<%= file.getName() %>" class="btn btn-sm btn-success">
                  <i class="fas fa-download"></i> Download
                </a>
                <a href="${pageContext.request.contextPath}/DeleteFile?fileName=<%= file.getName() %>" class="btn btn-sm btn-danger">
                  <i class="fas fa-trash"></i> Delete
                </a>
              </div>
            </li>
          <% 
              }
            } else {
          %>
            <p>Não há arquivos CSV no diretório.</p>
          <% 
            }
          %>
        </ul>
      </div>
    </div>
  </div>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/sb-admin-2.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script src="vendor/chart.js/Chart.min.js"></script>
</body>
</html>
