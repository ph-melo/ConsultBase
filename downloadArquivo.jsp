<%@page import="java.util.*"%>
<%@page import="controller.ListarArquivosCSV"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html lang="pt">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Download Arquivo</title>

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  
  <script>
    function filtrarArquivos() {
      var input = document.getElementById("filtro");
      var filter = input.value.toUpperCase();
      var lista = document.querySelectorAll(".arquivo-item");
      lista.forEach(function(item) {
        var texto = item.textContent || item.innerText;
        item.style.display = texto.toUpperCase().includes(filter) ? "" : "none";
      });
    }
  </script>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
    
    <!-- Sidebar -->
    <%@include file="sidebar.jsp" %>
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      
      <!-- Main Content -->
      <div id="content">
        
        <!-- Begin Page Content -->
        <div class="container-fluid">
          
          <br/>


          <h1>Arquivos para Download</h1>

          <!-- Search Bar -->
          <div class="input-group col-md-6 mb-3">
            <input type="search" class="form-control rounded" placeholder="Consultar" id="filtro" onkeyup="filtrarArquivos()">
            <span class="input-group-text border-0">
              <i class="fas fa-search"></i>
            </span>
          </div>

          <!-- File List -->
          <ul class="list-group">
		<%
            File folder = new File("/home/pcpcorp/portal_juridico/download");
            File[] files = folder.listFiles((dir, name) -> name.toLowerCase().endsWith(".csv"));
            if (files != null) {
                Arrays.sort(files);
                for (File file : files) {
        %>
              <li class="list-group-item d-flex justify-content-between align-items-center arquivo-item">
                <%= file.getName() %>
                <a href="${pageContext.request.contextPath}/DownloadFile?fileName=<%= file.getName() %>" class="btn btn-sm btn-success">
                  <i class="fas fa-download"></i> Download
                </a>
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

  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for all pages -->
  <script src="js/sb-admin-2.min.js"></script>

</body>
</html>
