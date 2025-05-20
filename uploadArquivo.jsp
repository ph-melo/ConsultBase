<%@page import="java.util.*"%>
<%@page import="controller.ListarArquivosCSV"%>
<%@page import="controller.ListarArquivosCsvFIXA"%>
<%@page import="controller.ListarArquivosCsvMOVEL" %>
<!DOCTYPE html>
<html lang="pt">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Upload Arquivo</title>
  
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  
  <script>
      window.onload = function() {
        document.getElementById("sidebarToggle").click();
      };
  </script>
  <style>
    #wrapper {
      display: flex;
    }
    #sidebar {
      width: 100px; /* Diminuindo o tamanho do menu lateral */
      position: fixed;
      height: 100vh;
      top: 0;
      left: 0;
      z-index: 1000;
      
    
    }
    #content-wrapper{
      margin-left: 215px;
      padding-right: 20px;
    }
    
  </style>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar">
       <%@include file="sidebar.jsp" %> 
    </div>
    
    <div id="content-wrapper" class="d-flex flex-column flex-grow-1">
      <div id="content" class="container-fluid p-4">
        
        <h1 class="mb-4">Upload de Arquivos</h1>
        
        <%
            String envio = request.getParameter("envio");
            if (envio != null && envio.equals("OK")) {
        %>
            <div class="alert alert-success" role="alert">
                Arquivo enviado com sucesso!
            </div>
        <%
            }
        %>
        
        <form class="row g-3" action="ImportServlet" method="POST" enctype="multipart/form-data">
          <label class="form-label">Selecione o Arquivo CSV</label>
          <div class="input-group">
            <input class="form-control" type="file" id="arquivo" name="arquivo" accept=".csv">
            <button type="submit" class="btn btn-success" disabled>Confirmar Envio</button>
          </div>
        </form>
        
        <div class="mt-4">
          <h2>Arquivos Enviados</h2>
          <label class="form-label">Arquivos Fixa IGFIN (SCM | IPTV | STFC)</label>
          <input type="search" class="form-control mb-3" id="filtro" placeholder="Consultar" onkeyup="filtrarArquivos()">
          <ul class="list-group">
            <%
              ListarArquivosCsvFIXA listador1 = new ListarArquivosCsvFIXA();
              List<String> arquivosCSV = listador1.listarArquivosCSVFIXA("/home/pcpcorp/portal_juridico/fixa");
              for (String arquivo : arquivosCSV) {
            %>
              <li class="list-group-item"><%=arquivo%> | <i class="fas fa-upload"></i> Em Processamento</li>
            <% } %>
          </ul>
          
          <label class="form-label mt-3">Arquivos Movel</label>
          <input type="search" class="form-control mb-3" id="filtro2" placeholder="Consultar" onkeyup="filtrarArquivos()">
          <ul class="list-group">
            <%
              ListarArquivosCsvMOVEL listador2 = new ListarArquivosCsvMOVEL();
              List<String> arquivosCSV1 = listador2.listarArquivosCSVMOVEL("/home/pcpcorp/portal_juridico/movel");
              for (String arquivo1 : arquivosCSV1) {
            %>
              <li class="list-group-item"><%=arquivo1%> | <i class="fa-regular fa-heart"></i> Em desenvolvimento </li>
            <% } %>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
                  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      var inputArquivo = document.getElementById("arquivo");
      var btnConfirmarEnvio = document.querySelector("button[type='submit']");
      inputArquivo.onchange = function() {
        btnConfirmarEnvio.disabled = !inputArquivo.value;
      };
    });
  </script>
</body>

</html>
