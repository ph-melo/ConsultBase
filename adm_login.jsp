<!DOCTYPE html>
<%@page import="DAO.OracleDAO"%>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Acesso Administrativo</title>
  
  <% 
      //OracleDAO daoteste = new OracleDAO();
     //System.out.println(daoteste.teste());
      %>
      
      

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <script>
    function conectar() {
        var user = document.getElementById("user").value;
        var pass = document.getElementById("pass").value;
        var action = "logar";
        $.ajax({
            url: "LoginPortalServlet",
            type: "POST",
            data: {user:user,pass:pass, action:action},
            success: function(resultText){
                window.location.href = "./adm_upload.jsp";
            },
            error: function (data, status, error) {
                 
                if(error == 'Not Acceptable'){
                    window.location.href = "./alterar_senha.jsp?senhapadrao=1";
                }else{
                   
                    $("#logoutModal").modal();
                }
           
            }
        });
        
    }
      
  </script>
  
</head>
<%
    String deslogar = "";
    try{
        deslogar = request.getParameter("exit");
    }catch(Exception e){
        e.printStackTrace();
    }
    if(deslogar == null){
        deslogar = "";
    }
    //System.out.println("deslogar " + deslogar + " - " + request.getSession().getAttribute("nomeSessao"));
    if(deslogar.equals("") &&  request.getSession().getAttribute("nomeSessao") != null && !request.getSession().getAttribute("nomeSessao").equals("")){
        
        response.sendRedirect("./adm_upload.jsp"); //sidebar_juri.jsp
    }else if( deslogar.equals("1") ){
      request.getSession().invalidate();
    }

    %>
<body class="bg-gradient-dark">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"><img src="imagens/OPENGRAPH-VIVO.png" width="465" height="450" alt=""/></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Acesso Administrativo</h1>
                                    </div>
                                    
                                        <div class="form-group">
                                            <input type="text" required class="form-control form-control-user"
                                                id="user" name ="user"
                                                placeholder="Usuário">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" required class="form-control form-control-user"
                                                 id="pass" name="pass" placeholder="Senha">
                                        </div>
                                        
                                        <button onclick="conectar()" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
                                        <hr>
                                        
                                    
                                    
                                    
                                    <div class="text-center">
                                        <a class="small" href="alterar_senha.jsp">Alterar Senha</a>
                                    </div>
                                  	<div class="text-center">
                                        <a class="small" href="index.jsp">Acesso Usuário</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Login e/ou senha inválidos</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
   <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>
  
</body>

</html>
