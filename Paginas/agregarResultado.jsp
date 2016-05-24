<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cabeceraJsp.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mobyzer - Alta</title>
    <script>document.location = "mobyzer.jsp"</script>
  </head>
  <body>
    <%
      request.setCharacterEncoding("UTF-8"); // CODIFICA LAS PETICIONES RECIBIDAS EN UTF-8
      
      String insert = "INSERT DISPOSITIVO (idDispositivo, modelo, marca, idCpu) VALUES ("
              + Integer.valueOf(request.getParameter("id"))
              + ", '" + request.getParameter("modelo")
              + "', '" + request.getParameter("marca") 
              + "', " + Integer.valueOf(request.getParameter("idCpu")) + ")";
      
      s.execute(insert);
    %>
  </body>
</html>