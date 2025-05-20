<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<html>
<head>
<title>Lista de Arquivos CSV</title>
</head>
<body>
<h2>Arquivos CSV Dispon�veis</h2>
<ul>
<%
            File folder = new File("/home/pcpcorp/portal_juridico/download");
            File[] files = folder.listFiles((dir, name) -> name.toLowerCase().endsWith(".csv"));
            if (files != null) {
                Arrays.sort(files);
                for (File file : files) {
        %>
<li>
<%= file.getName() %> 
<a href="${pageContext.request.contextPath}/DownloadFile?fileName=<%= file.getName() %>">
<button>Download</button>
</a>
</li>
<%
                }
            } else {
        %>
<p>N�o h� arquivos CSV no diret�rio.</p>
<%
            }
        %>
</ul>
</body>
</html>