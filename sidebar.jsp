<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("nomeSessao") == null || request.getSession().getAttribute("nomeSessao").equals("")) {
             response.sendRedirect("./index.jsp");
    }
    %>

        <ul class="navbar-nav  bg-gradient-primary sidebar  sidebar-dark accordion " id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon ">
          <i class="fab fa-buffer"></i>
        </div>
        <div class="sidebar-brand-text mx-1">ConsultBase</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">


      <!-- Heading -->
      <div class="sidebar-heading">
        
      </div>

      <!-- Nav Item -  Menu -->
      <li class="nav-item">
        <a class="nav-link" href="./home.jsp">
        <i class="fas fa-fw fa-home"></i>
          <span>Home</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="./uploadArquivo.jsp">
        <i class="fas fa-fw fa-upload"></i>
          <span>Upload</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="./downloadArquivo.jsp">
        <i class="fas fa-fw fa-download"></i>
          <span>Download</span>
        </a>
      </li>
      
            <!-- Nav Item - Pages Collapse Menu --> 

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="./index.jsp?exit=1">
        <i class="fas fa-sign-out-alt"></i>
        <span>Sair</span></a>
      </li>
     

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
       
      	<li class="nav-item">
      	<a class="nav-link" href="#">
      	<i class="fas fa-user-o"></i>
      	<span></span>
      	</a>
       </li>
       
      
		<li class="nav-item">
      	<a class="nav-link" href="#">
      	<i class="fas fa-user-o"></i>
      	<span></span>
      	</a>
       </li>
       
		<li class="nav-item">
      	<a class="nav-link" href="#">
      	<i class="fas fa-user-o"></i>
      	<span></span>
      	</a>
       </li>
       
       		<li class="nav-item">
      	<a class="nav-link" href="#">
      	<i class="fas fa-user-o"></i>
      	<span></span>
      	</a>
       </li>
		
		
	 
        <li class="nav-item">
      	<a class="d-flex align-items-center justify-content-center" href="#">
      	<i class="fas fa-user-o"></i>
      		<span>Em Desenvolvimento</span>
      	</a>
      </li>
      
      <li class="nav-item">
      <a class="d-flex align-items-center justify-content-center" href="#">
      <i class="fas fa-user-o"></i>
      	<span>Versão: 05.05.2025</span>
      </a>
      </li>
	 
    </ul>
    
    <!-- End of Sidebar -->
    
 

 